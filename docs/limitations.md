@title Limitations

# Limitations
Both Google and Apple enforce some limitations on how this API works, which you should take into account when using this extension.

## Android

* This feature will only work when it was downloaded from store.
* You only can display this popup one time.
* If you want test it you need upload it to "Internal Testing" in the [Google Play Console](https://play.google.com/console/).

### Links

Below are some links you can follow that provide information about the most frequent problems:

* [Main Information](https://developer.android.com/guide/playcore/in-app-review)
* [Troubleshooting](https://developer.android.com/guide/playcore/in-app-review/test#troubleshooting)
* [Testing](https://developer.android.com/guide/playcore/in-app-review/test)

## iOS

* No matter how many times you request the review prompt, the system will show the prompt a maximum of three times in a 365-day period.
* Calling the method is not a guarantee that the prompt will display. This means that it’s not appropriate to call the API in response to a button tap or other user action.
* The system must not have shown the prompt for a version of the app bundle that matches the current bundle version. This ensures that the user is not asked to review the same version of your app multiple times.

### Notes

The review prompt will behave differently depending on the type of build that you are running:

* **Development** - Shown every time you request the prompt.
* **Test Flight** - Prompt is never shown.
* **App Store** - Shown with the limitations described above.