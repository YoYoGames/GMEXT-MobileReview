// ##### extgen :: Auto-generated file do not edit!! #####

// #####################################################################
// # Macros
// #####################################################################

// #####################################################################
// # Enums
// #####################################################################

// #####################################################################
// # Constructors
// #####################################################################

// #####################################################################
// # Codecs
// #####################################################################

// #####################################################################
// # Functions
// #####################################################################

/**
 * @param {Function} _callback
 */
function mobile_review_show(_callback)
{
    var __available__ = __GMMobileReview_is_available();
    if (!__available__) return;

    var __dispatcher__ = __GMMobileReview_get_dispatcher();

    var __args_buffer = __ext_core_get_args_buffer();

    // param: _callback, type: Function
    if (!is_callable(_callback)) show_error($"{_GMFUNCTION_} :: _callback expected callable type", true);
    var _callback_handle = __ext_core_function_register(_callback, __dispatcher__);
    buffer_write(__args_buffer, buffer_u64, _callback_handle);

    var __return_value__ = __mobile_review_show(buffer_get_address(__args_buffer), buffer_tell(__args_buffer));

    return __return_value__;
}

/// @ignore
function __GMMobileReview_get_decoders()
{
    static __decoders__ = [];
    return __decoders__;
}
/// @ignore
function __GMMobileReview_get_dispatcher()
{
    static __dispatcher__ = new __GMNativeFunctionDispatcher(__GMMobileReview_invocation_handler, __GMMobileReview_get_decoders());
    return __dispatcher__;
}
/// @ignore
function __GMMobileReview_is_available()
{
    static __available__ = extension_exists("GMMobileReview");
    return __available__;
}
