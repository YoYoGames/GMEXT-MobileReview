// FUNCTIONS

/**
 * @func mobile_review_show
 * @desc This function starts the in-app review flow and can be triggered at any time throughout the user journey of your app. During the flow, the user has the ability to rate your app using the 1 to 5 star system and to add an optional comment. Once submitted, the review is sent to the store and eventually displayed.
 *
 * [[Note: A `success` result does **not** mean that the review prompt was shown or that the user submitted a review. On Android it means the Google Play review flow task completed; on iOS it means the request was handed to StoreKit (which never reports a result). Both stores decide whether the prompt actually appears, subject to the rules described in ${page.limitations}. Do not gate game logic on the user having left a review.]]
 *
 * @param {Function} callback The function to be called once the in-app review flow finishes. It receives the arguments listed in the **Callback** section below.
 *
 * @event callback
 * @member {Bool} success Whether the in-app review flow completed without error (see the note above for what this does and does not guarantee).
 * @member {String} error A description of what went wrong when `success` is `false`; an empty string otherwise.
 * @event_end
 *
 * @example
 * ```gml
 * mobile_review_show(function(_success, _error)
 * {
 *     if (_success)
 *     {
 *         show_debug_message("Review request completed.");
 *     }
 *     else
 *     {
 *         show_debug_message("Review request failed: " + _error);
 *     }
 * });
 * ```
 * @func_end
 */
function mobile_review_show(callback) {}

// CONSTANTS

// MODULES

/**
 * @module home
 * @title Home
 * @desc The Mobile Review extension works both on Android (using [Google Play In-App Reviews API](https://developer.android.com/guide/playcore/in-app-review)) and on iOS (using the native [StoreKit Framework](https://developer.apple.com/documentation/storekit)) and lets you prompt users to submit ratings and reviews without the inconvenience of leaving your app or game.
 *
 * @section Guides
 * @desc The following pages will help you get up and running with the extension:
 * @ref page.getting_started
 * @ref page.limitations
 * @section_end
 *
 * @section Modules
 * @desc The following pages list the functions of the Mobile Review extension:
 * @ref module.functions
 * @section_end
 *
 * @module_end
 */

/**
 * @module functions
 * @title Functions
 * @desc This is a general-purpose module that contains a variety of functions.
 * @section Functions
 * @desc These are the functions of the Mobile Review extension:
 * @ref function.mobile_review_show
 * @section_end
 * @module_end
 */
