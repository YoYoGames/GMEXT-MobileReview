/// Press Event

mobile_review_show(
    function(_success, _error)
    {
        if (_success)
        {
            show_debug_message("Review request completed successfully.");
        }
        else
        {
            show_debug_message(
                "Review request failed: " + _error
            );
        }
    }
);
