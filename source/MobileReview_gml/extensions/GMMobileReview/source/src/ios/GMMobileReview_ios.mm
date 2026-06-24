
#import <StoreKit/StoreKit.h>

#import "GMMobileReview_ios.h"

/**
 * Extension Generator implementation for Apple in-app review.
 *
 * Callback:
 *     callback(success, error)
 *
 * StoreKit does not provide a completion handler. Success only means that the
 * request was submitted to StoreKit. Apple decides whether the prompt appears.
 */
@implementation GMMobileReview

- (void)mobile_review_show:(gm::wire::GMFunction)callback
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (@available(iOS 14.0, *))
        {
            UIWindowScene *windowScene = nil;

            for (UIScene *scene in UIApplication.sharedApplication.connectedScenes)
            {
                if (scene.activationState == UISceneActivationStateForegroundActive &&
                    [scene isKindOfClass:[UIWindowScene class]])
                {
                    windowScene = (UIWindowScene *)scene;
                    break;
                }
            }

            if (windowScene != nil)
            {
                [SKStoreReviewController requestReviewInScene:windowScene];
                callback.call(true, "");
            }
            else
            {
                callback.call(
                    false,
                    "No active foreground UIWindowScene was found."
                );
            }

            return;
        }

        if (@available(iOS 10.3, *))
        {
            [SKStoreReviewController requestReview];
            callback.call(true, "");
            return;
        }

        callback.call(
            false,
            "In-app review requires iOS 10.3 or later."
        );
    });
}

@end
