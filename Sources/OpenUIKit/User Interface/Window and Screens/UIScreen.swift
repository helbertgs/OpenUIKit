import Foundation
import CoreGraphics

/// An object that defines the properties associated with a hardware-based display.
public class UIScreen {

    // MARK: - Getting the size and scale

    /// The bounding rectangle of the screen, measured in points.
    public internal(set) var bounds: Rect = .zero

    /// The bounding rectangle of the physical screen, measured in pixels.
    public internal(set) var nativeBounds: Rect = .zero

    /// The natural scale factor associated with the screen.
    public internal(set) var scale: Float = 0
}