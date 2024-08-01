import Foundation

/// A set of methods for converting between different frames of reference on a screen.
@MainActor public protocol UICoordinateSpace {

    // MARK: - Getting the bounds rectangle

    /// The bounds rectangle describing the item’s location and size in its own coordinate system.
    var bounds: Rect { get set }

    // MARK: - Converting between coordinate spaces

    /// Converts a point from the coordinate space of the current object to the specified coordinate space.
    /// - Parameters:
    ///   - point: A point specified in the coordinate system of the current object.
    ///   - coordinateSpace: The coordinate space into which point is to be converted.
    /// - Returns: A point specified in the target coordinate space.
    func convert(
        _ point: Point,
        to coordinateSpace: any UICoordinateSpace
    ) -> Point
    
    /// Converts a point from the specified coordinate space to the coordinate space of the current object.
    /// - Parameters:
    ///   - point: A point in the specified coordinate space.
    ///   - coordinateSpace: The coordinate space in which point is specified.
    /// - Returns: A point specified in the coordinate space of the current object.
    func convert(
        _ point: Point,
        from coordinateSpace: any UICoordinateSpace
    ) -> Point
    
    /// Converts a rectangle from the coordinate space of the current object to the specified coordinate space.
    /// - Parameters:
    ///   - rect: A rectangle specified in the coordinate system of the current object.
    ///   - coordinateSpace: The coordinate space into which rect is to be converted.
    /// - Returns: A rectangle specified in the target coordinate space.
    func convert(
        _ rect: Rect,
        to coordinateSpace: any UICoordinateSpace
    ) -> Rect
    
    /// Converts a rectangle from the specified coordinate space to the coordinate space of the current object.
    /// - Parameters:
    ///   - rect: A rectangle in the specified coordinate space.
    ///   - coordinateSpace: The coordinate space in which rect is specified.
    /// - Returns: A rectangle specified in the coordinate space of the current object.
    func convert(
        _ rect: Rect,
        from coordinateSpace: any UICoordinateSpace
    ) -> Rect
}
