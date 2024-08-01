import Foundation

/// An object that represents one instance of your app’s user interface.
@MainActor public class UIScene : Equatable, Hashable {

    // MARK: - Managing the life cycle of a scene

    /// The object you use to receive life-cycle events associated with the scene.
    public var delegate: (any UISceneDelegate)?

    // MARK: - Getting the scene attributes

    /// The current execution state of the scene.
    public var activationState: UIScene.ActivationState = .foregroundInactive

    /// A user-visible string you supply to help users differentiate among your app’s scenes.
    public var title: String?

    /// A string that the app displays in the title bar of a window when running in macOS.
    public var subtitle: String?

    // MARK: - Getting the scene’s session

    /// The session associated with the scene.
    public let session: UISceneSession

    public let connectionOptions: UIScene.ConnectionOptions

    // MARK: - Creating a scene object

    /// Creates a scene object using the specified session and connection information.
    /// - Parameters:
    ///   - session: A session object containing the configuration details for the scene. The system creates the session object and passes it to this initialization method.
    ///   - connectionOptions: An object containing additional options for connecting the scene to your app.
    public required init(session: UISceneSession, connectionOptions: UIScene.ConnectionOptions) {
        self.session = session
        self.connectionOptions = connectionOptions
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(session.hashValue)
    }

    // MARK: - Equatable

    public static func == (lhs: UIScene, rhs: UIScene) -> Bool {
        lhs.session == rhs.session &&
        lhs.title == rhs.title &&
        lhs.subtitle == rhs.subtitle
    }
}


extension UIScene {

    /// A data object containing information about the reasons why OpenUIKit created the scene.
    @MainActor
    public class ConnectionOptions {
        public init() { }
    }
}

extension UIScene {

    /// Constants that indicate the foreground or background execution state of your app.
    public enum ActivationState : String, Equatable, Hashable, @unchecked Sendable {
        // MARK: - Scene States

        /// A state that indicates that the scene is not currently connected to your app.
        case unattached

        /// A state that indicates that the scene is running in the foreground but is not receiving events.
        case foregroundInactive

        /// A state that indicates that the scene is running in the foreground and is currently receiving events.
        case foregroundActive

        /// A state that indicates that the scene is running in the background and is not onscreen.
        case background
    }
}
