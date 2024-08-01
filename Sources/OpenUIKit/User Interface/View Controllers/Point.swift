import Foundation

/// A structure that contains a point in a two-dimensional coordinate system.
@frozen public struct Point {
    
    // MARK: - Geometric Properties

    /// The x-coordinate of the point.
    public let x: Double

    /// The y-coordinate of the point.
    public let y: Double

    // MARK: - Special Values
    
    /// The point with location (0,0).
    public static let zero = Point()

    // MARK: - Creating Point Values

    /// Creates a point with coordinates specified as floating-point values.
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    @inlinable public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    /// Creates a point with coordinates specified as integer values.
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    @inlinable public init(x: Int, y: Int) {
        self.x = Double(x)
        self.y = Double(y)
    }

    /// Creates a point with location (0,0).
    public init() {
        self.x = 0
        self.y = 0
    }
}
