
package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.GMExtWire.GMFunction;

import android.app.Activity;

import com.google.android.gms.tasks.Task;
import com.google.android.play.core.review.ReviewInfo;
import com.google.android.play.core.review.ReviewManager;
import com.google.android.play.core.review.ReviewManagerFactory;

/**
 * Extension Generator implementation for Google Play in-app review.
 *
 * Callback:
 *     callback(success, error)
 *
 * Success means that Google Play completed the review flow task.
 * Google Play does not report whether the dialog was displayed or whether
 * the user submitted a review.
 */
public class GMMobileReview extends GMMobileReviewInternal
{
    public void mobile_review_show(final GMFunction callback)
    {
        final Activity activity = RunnerActivity.CurrentActivity;

        if (activity == null)
        {
            callback.call(false, "Activity is null.");
            return;
        }

        activity.runOnUiThread(() ->
        {
            final ReviewManager manager =
                ReviewManagerFactory.create(activity);

            final Task<ReviewInfo> request =
                manager.requestReviewFlow();

            request.addOnCompleteListener(requestTask ->
            {
                if (!requestTask.isSuccessful())
                {
                    callback.call(
                        false,
                        error(requestTask.getException())
                    );
                    return;
                }

                final ReviewInfo reviewInfo =
                    requestTask.getResult();

                if (reviewInfo == null)
                {
                    callback.call(
                        false,
                        "Google Play returned no ReviewInfo."
                    );
                    return;
                }

                final Task<Void> flow =
                    manager.launchReviewFlow(activity, reviewInfo);

                flow.addOnCompleteListener(flowTask ->
                {
                    if (flowTask.isSuccessful())
                    {
                        callback.call(true, "");
                    }
                    else
                    {
                        callback.call(
                            false,
                            error(flowTask.getException())
                        );
                    }
                });
            });
        });
    }

    private static String error(Throwable throwable)
    {
        if (throwable == null)
            return "Unknown in-app review error.";

        final String message = throwable.getMessage();
        return message != null ? message : throwable.toString();
    }
}
