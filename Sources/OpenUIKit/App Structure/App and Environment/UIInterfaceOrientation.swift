import Foundation

@frozen
public enum UIInterfaceOrientation : String, Codable, Equatable, Hashable, @unchecked Sendable {

    // MARK: - Orientations

    /// The orientation of the device is unknown.
    case unknown

    /// The device is in portrait mode, with the device upright and the Home button on the bottom.
    case portrait

    /// The device is in portrait mode but is upside down, with the device upright and the Home button at the top.
    case portraitUpsideDown

    /// The device is in landscape mode, with the device upright and the Home button on the left.
    case landscapeLeft

    /// The device is in landscape mode, with the device upright and the Home button on the right.
    case landscapeRight

    // MARK: - Orientation Checks

    /// A Boolean value that indicates whether the user interface is currently presented in a landscape orientation.
    var isLandscape: Bool {
        return switch self {
            case .landscapeLeft, .landscapeRight: true
            default: false
        }
    }

    /// A Boolean value that indicates whether the user interface is currently presented in a portrait orientation.
    var isPortrait: Bool {
        return switch self {
            case .portrait, .portraitUpsideDown: true
            default: false
        }
    }
}
