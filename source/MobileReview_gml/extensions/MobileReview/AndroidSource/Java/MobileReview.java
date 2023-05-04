package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.google.android.play.core.review.ReviewManager;
import com.google.android.play.core.review.ReviewManagerFactory;
import com.google.android.play.core.tasks.Task;
import com.google.android.play.core.review.ReviewInfo;
import com.google.android.play.core.tasks.OnCompleteListener;
import com.google.android.play.core.review.testing.FakeReviewManager;

import android.util.Log;

public class MobileReview extends RunnerSocial
{
	int EVENT_OTHER_SOCIAL = 70;
	
	Activity activity = RunnerActivity.CurrentActivity;
 
	public void MobileReview_Show()
	{
		final ReviewManager manager = ReviewManagerFactory.create(activity);
		//final ReviewManager manager = new FakeReviewManager(activity);
		
		Task<ReviewInfo> request = manager.requestReviewFlow();
		request.addOnCompleteListener(new OnCompleteListener<ReviewInfo>() 
		{
			@Override
			public void onComplete(/*@NonNull*/ Task<ReviewInfo> task) 
			{
			   if (task.isSuccessful()) 
				{
					// We can get the ReviewInfo object
					ReviewInfo reviewInfo = task.getResult();
					final Task<Void> flow = manager.launchReviewFlow(activity,reviewInfo);
					flow.addOnCompleteListener(new OnCompleteListener<Void>() 
					{
						@Override
						public void onComplete(/*@NonNull*/ Task<Void> task) 
						{
							if (task.isSuccessful())
							{
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddString( dsMapIndex, "type", "MobileReview_Show" );
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 1.0);
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);

							}
							else 
							{
								int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
								RunnerJNILib.DsMapAddString( dsMapIndex, "type", "MobileReview_Show" );
								RunnerJNILib.DsMapAddDouble( dsMapIndex, "success", 0.0);
								RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
							}
						}
					});
				}
			}
		});
	}
}

