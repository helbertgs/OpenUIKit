import Foundation

/// An object that manages the content for a rectangular area on the screen.
@MainActor open class UIView {

    // MARK: - Configuring the bounds and frame rectangles

    /// The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
    public var frame: Rect

    // MARK: - Configuring a view’s visual appearance
    
    /// The view’s background color.
    public var backgroundColor: UIColor?
    
    /// A Boolean value that determines whether the view is hidden.
    public var isHidden: Bool = false
    
    /// The view’s alpha value.
    public var alpha: Float = 1
    
    /// A Boolean value that determines whether the view is opaque.
    public var isOpaque: Bool = true

    // MARK: - Managing the view hierarchy

    /// The receiver’s superview, or nil if it has none.
    public internal(set) var superview: UIView?

    /// The receiver’s immediate subviews.
    public internal(set) var subviews: [UIView] = []

    // MARK: - Creating a view object

    /// Creates a view with the specified frame rectangle.
    /// - Parameter frame: The frame rectangle for the view, measured in points. The origin of the frame is relative to the superview in which you plan to add it. This method uses the frame rectangle to set the center and bounds properties accordingly.
    public init(frame: Rect) {
        self.frame = frame
    }
}