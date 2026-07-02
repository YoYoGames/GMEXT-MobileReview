# GMEXT-MobileReview
Repository for GameMaker's Mobile Review Extension

This repository was created with the intent of presenting users with the latest version available of the extension (even previous to marketplace updates) and also provide a way for the community to contribute with bug fixes and feature implementation.

This extension lets you prompt players to rate and review your app from inside the game, using the platform's native in-app review flow. It exposes a single function, `mobile_review_show(callback)`, and works on **Android** (using the [Google Play In-App Reviews API](https://developer.android.com/guide/playcore/in-app-review)) and **iOS** (using the native [StoreKit Framework](https://developer.apple.com/documentation/storekit)).

* Android source: `source/MobileReview_gml/extensions/GMMobileReview/AndroidSource/`
* iOS source: `source/MobileReview_gml/extensions/GMMobileReview/source/src/ios/`

## Documentation

* Check [the documentation](../../wiki)

The online documentation is regularly updated to ensure it contains the most current information. For those who prefer a different format, we also offer an HTML version. This HTML is directly converted from the GitHub Wiki content, ensuring consistency, although it may follow slightly behind in updates.

We encourage users to refer primarily to the GitHub Wiki for the latest information and updates. The HTML version, included with the extension and within the demo project's data files, serves as a secondary, static reference.

Additionally, if you're contributing new features through PR (Pull Requests), we kindly ask that you also provide accompanying documentation for these features, to maintain the comprehensiveness and usefulness of our resources.
