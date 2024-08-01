import Foundation

/// An object that contains information about one of your app’s scenes.
@MainActor
public class UISceneSession : Equatable, Hashable, Sendable {

    // MARK: - Getting the scene information

    /// The scene associated with the current session.
    public weak internal(set) var scene: UIScene?

    /// The role played by the scene’s content.
    public var role: UISceneSession.Role

    // MARK: - Getting the scene configuration details

    /// The configuration data for creating the scene.
    public internal(set) var configuration: UISceneConfiguration

    // MARK: - Identifying the scene

    /// A unique identifier that persists for the lifetime of the session.
    public var persistentIdentifier: String

    // MARK: - Getting additional session information

    /// Custom attributes that you can associate with the scene.
    public var userInfo: [String : Any]?

    // MARK: - Creating an UISceneSession

    internal init(scene: UIScene? = nil, role: UISceneSession.Role = .windowApplication, configuration: UISceneConfiguration, persistentIdentifier: String, userInfo: [String : Any]? = nil) {
        self.scene = scene
        self.role = role
        self.configuration = configuration
        self.persistentIdentifier = persistentIdentifier
        self.userInfo = userInfo
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(persistentIdentifier)
    }

    // MARK: - Equatable

    public static func == (_ lhs: UISceneSession, _ rhs: UISceneSession) -> Bool {
        lhs.persistentIdentifier == rhs.persistentIdentifier
    }
}

extension UISceneSession {

    /// Constants that indicate the possible roles for a scene.
    @frozen
    public struct Role : Codable, Equatable, Hashable, RawRepresentable, Sendable {

        /// The raw type that can be used to represent all values of the conforming
        /// type.
        ///
        /// Every distinct value of the conforming type has a corresponding unique
        /// value of the `RawValue` type, but there may be values of the `RawValue`
        /// type that don't have a corresponding value of the conforming type.
        public typealias RawValue = String

        /// The corresponding value of the raw type.
        ///
        /// A new instance initialized with `rawValue` will be equivalent to this
        /// instance. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     let selectedSize = PaperSize.Letter
        ///     print(selectedSize.rawValue)
        ///     // Prints "Letter"
        ///
        ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
        ///     // Prints "true"
        public var rawValue: RawValue

        /// Creates a scene role with the specified raw value.
        public init(rawValue: RawValue) {
            self.rawValue = rawValue
        }

        // MARK: - Determining scene roles

        /// A scene that displays interactive windows on the device’s built-in display or an externally connected display.
        @MainActor public static let windowApplication = UISceneSession.Role(rawValue: "UIWindowSceneSessionRoleApplication")
    }
}
