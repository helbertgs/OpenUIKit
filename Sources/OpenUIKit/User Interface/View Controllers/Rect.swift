import Foundation

/// A structure that contains the location and dimensions of a rectangle.
public struct Rect {
    
    // MARK: - Basic Geometric Properties

    /// A point that specifies the coordinates of the rectangle’s origin.
    public var origin: Point
    
    /// A size that specifies the height and width of the rectangle.
    public var size: Size

    // MARK: - Special Values

    /// A rectangle that has infinite extent.
    public static let infinite = Rect(x: .infinity, y: .infinity, width: .infinity, height: .infinity)

    /// The null rectangle, representing an invalid value.
    public static let null = Rect(x: .nan, y: .nan, width: .nan, height: .nan)

    /// The rectangle whose origin and size are both zero.
    public static let zero = Rect(origin: .zero, size: .zero)

    // MARK: - Calculated Geometric Properties

    /// Returns the smallest value for the x-coordinate of the rectangle.
    public var minX: Double { origin.x }

    /// Returns the x- coordinate that establishes the center of a rectangle.
    public var midX: Double { origin.x + (size.width / 2) }

    /// Returns the largest value of the x-coordinate for the rectangle.
    public var maxX: Double { origin.x + size.width }

    /// Returns the smallest value for the y-coordinate of the rectangle.
    public var minY: Double { origin.y }

    /// Returns the y-coordinate that establishes the center of the rectangle.
    public var midY: Double { origin.y + (size.height / 2) }

    /// Returns the largest value for the y-coordinate of the rectangle.
    public var maxY: Double { origin.y + size.height }

    // MARK: - Creating a Rect

    /// Creates a rectangle with the specified origin and size.
    /// - Parameters:
    ///   - origin: A point that specifies the coordinates of the rectangle’s origin.
    ///   - size: A size that specifies the height and width of the rectangle.
    public init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    /// Creates a rectangle with coordinates and dimensions specified as floating-point values.
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    ///   - width: A width value.
    ///   - height: A height value.
    public init(x: Double, y: Double, width: Double, height: Double) {
        self.origin = Point(x: x, y: y)
        self.size = Size(width: width, height: height)
    }
}
