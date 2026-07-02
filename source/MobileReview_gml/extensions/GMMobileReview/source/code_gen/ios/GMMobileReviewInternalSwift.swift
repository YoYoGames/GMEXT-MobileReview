import Foundation
import os.log
import CxxStdlib

open class GMMobileReviewInternalSwift
{
    internal var __dispatch_queue: GMDispatchQueue = GMDispatchQueue()

    public init()
    {
    }

    open func mobile_review_show(callback: GMFunction)
    {
        // default stub for mobile_review_show
    }

    public func __EXT_SWIFT__mobile_review_show(_ __arg_buffer: UnsafeMutablePointer<CChar>?, arg1 __arg_buffer_length: Double) -> Double
    {
        do
        {
            var __br = BufferReader(base: UnsafeRawPointer(__arg_buffer!), size: Int(__arg_buffer_length))

            // field: callback, type: Function
            let callback: GMFunction = try __br.readGMFunction(__dispatch_queue)

            self.mobile_review_show(callback: callback)
            return 0.0
        }
        catch
        {
            os_log("Corrupted buffer when calling 'mobile_review_show'", log: .default, type: .error)
            return -1
        }
    }

    public func __EXT_SWIFT__GMMobileReview_invocation_handler(_ __ret_buffer: UnsafeMutablePointer<CChar>?, arg1 __ret_buffer_length: Double) -> Double
    {
        var __bw = BufferWriter(base: UnsafeMutableRawPointer(__ret_buffer!), size: Int(__ret_buffer_length))
        return __dispatch_queue.fetch(into: &__bw)
    }

}
