
show_debug_message("ASYNC SOCIAL EVENT: " + json_encode(async_load))

if(async_load[?"type"] == "MobileReview_Show")
if(async_load[?"success"])
	show_debug_message("Review Success")
else
	show_debug_message("Review Failed")
