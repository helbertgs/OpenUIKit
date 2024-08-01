import Foundation

/// A structure that contains width and height values.
@frozen public struct Size {

    // MARK: - Geometric Properties

    /// A width value.
    public let width: Double

    /// A height value.
    public let height: Double

    // MARK: - Special Values

    /// The size whose width and height are both zero.
    public static let zero = Size()

    // MARK: - 

    /// Creates a size whose width and height are both specified as floating-point values.
    /// - Parameters:
    ///   - width: A width value.
    ///   - height: A height value.
    @inlinable public init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    /// Creates a size with zero width and height.
    /// - Parameters:
    ///   - width: A width value.
    ///   - height: A height value.    
    @inlinable public init() {
        self.width = 0
        self.height = 0
    }
}