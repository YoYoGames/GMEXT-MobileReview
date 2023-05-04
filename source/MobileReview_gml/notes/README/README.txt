
---------------Android Limitations---------------

	-This feature only will work when was downloaded from store
	-You only can display this popup one time
	-if you want test it you need upload it to "Internal Testing" in GooglePlay console

Please read the Troubleshooting section

Main Information:
https://developer.android.com/guide/playcore/in-app-review

Troubleshooting:
https://developer.android.com/guide/playcore/in-app-review/test#troubleshooting

Testing:
https://developer.android.com/guide/playcore/in-app-review/test


---------------iOS Limitations---------------

Apple does enforce certain limitations on how you use this API:

	-No matter how many times you request the review prompt, the system will show the prompt a maximum of three times in a 365-day period.
	-Calling the method is not a guarantee that the prompt will display. This means that it’s not appropriate to call the API in response to a button tap or other user action.
	-The system must not have shown the prompt for a version of the app bundle that matches the current bundle version. This ensures that the user is not asked to review the same version of your app multiple times.

Note: The review prompt will behave differently depending on the type of build that you are running:
	-Development: Shown every time the you request the prompt.
	-Test Flight: Prompt is never shown.
	-App Store: Shown with the limitations described above.

