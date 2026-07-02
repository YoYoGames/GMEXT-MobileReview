@title Getting Started

# Getting Started

The Mobile Review extension lets you prompt the player to rate and review your app from inside the game, using the platform's native in-app review flow — [Google Play In-App Reviews](https://developer.android.com/guide/playcore/in-app-review) on Android and [StoreKit](https://developer.apple.com/documentation/storekit) on iOS.

## Setup

There is nothing to configure. The extension has no Extension Options and requires no additional permissions — just add it to your project and call the function below. The required Google Play review library is pulled in automatically on Android, and the `StoreKit` framework is linked automatically on iOS.

## Showing the review prompt

The extension exposes a single function, ${function.mobile_review_show}. Call it at a natural moment in the player's journey (for example after they complete a level), passing a callback that runs once the flow finishes:

```gml
mobile_review_show(function(_success, _error)
{
    if (_success)
    {
        show_debug_message("Review request completed.");
    }
    else
    {
        show_debug_message("Review request failed: " + _error);
    }
});
```

The callback receives:

* `_success` — a boolean indicating whether the in-app review flow completed without error.
* `_error` — a string describing the failure when `_success` is `false` (empty otherwise).

> [!IMPORTANT]
> A `success` result does **not** mean the prompt was shown or that the user submitted a review. On Android it only means the Google Play flow task completed; on iOS it only means the request was handed to StoreKit, which never reports back whether anything was displayed. Both stores decide if and when the prompt actually appears. Do not gate game logic (rewards, unlocks, etc.) on the player having reviewed.

## Testing

The prompt is heavily rate-limited and will often not appear during normal development. Behaviour differs per store:

* **Android** — the flow only works for apps installed from Google Play. To test it, upload a build to the **Internal testing** track in the [Google Play Console](https://play.google.com/console/) and install from there.
* **iOS** — the prompt is shown every time in **development** builds, is **never** shown in **TestFlight** builds, and is rate-limited in **App Store** builds.

See ${page.limitations} for the full set of store-imposed rules you should design around.
