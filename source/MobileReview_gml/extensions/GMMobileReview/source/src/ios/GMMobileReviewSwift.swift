
import Foundation
import CxxStdlib
import StoreKit
import UIKit

public class GMMobileReviewSwift: GMMobileReviewInternalSwift
{
    public override init()
    {
        super.init()
    }

    public override func mobile_review_show(callback: GMFunction)
    {
        Task { @MainActor in
            guard #available(iOS 16.0, *) else
            {
                callback.call(
                    false,
                    "AppStore.requestReview(in:) requires iOS 16.0 or later."
                )
                return
            }

            guard let windowScene = UIApplication.shared.connectedScenes
                .compactMap({ $0 as? UIWindowScene })
                .first(where: { $0.activationState == .foregroundActive })
            else
            {
                callback.call(
                    false,
                    "No active foreground UIWindowScene was found."
                )
                return
            }

            AppStore.requestReview(in: windowScene)

            callback.call(true, "")
        }
    }
}

