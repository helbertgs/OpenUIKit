import Foundation

@MainActor
@preconcurrency
public class UIApplication {

    // MARK: - Accessing the shared application

    /// The singleton app instance.
    public static var shared = UIApplication()

    // MARK: - Configuring your app’s behavior

    public internal(set) var delegate: (any UIApplicationDelegate)?

    // MARK: - Getting the application state

    /// The app’s current state, or that of its most active scene.
    public private(set) var applicationState: UIApplication.State = .inactive

    // MARK: - Providing a window

    /// This property contains the window used to present the app’s visual content on the device’s main screen.
    public var window: UIWindow?

    // MARK: - Getting scene information

    /// A Boolean value that indicates whether the app may display multiple scenes simultaneously.
    public var supportsMultipleScenes: Bool = true

    /// The app’s currently connected scenes.
    public internal(set) var connectedScenes: Set<UIScene> = .init()

    /// The sessions whose scenes are either currently active or archived by the system.
    public internal(set) var openSessions: Set<UISceneSession> = .init()

    // MARK: - Creating an UIApplication

    internal var information: UIInformation?

    public required init() { }

    // MARK: - Responding to app life-cycle events

    /// Tells the delegate that the app has become active.
    /// - Parameter application: Your singleton app object.
    public func applicationDidBecomeActive(_ application: UIApplication) {
        print("\(Self.self).\(#function)")
    }
    
    /// Tells the delegate that the app is about to become inactive.
    /// - Parameter application: Your singleton app object.
    public func applicationWillResignActive(_ application: UIApplication) {
        print("\(Self.self).\(#function)")
    }
    
    /// Tells the delegate that the app is now in the background.
    /// - Parameter application: Your singleton app object.
    public func applicationDidEnterBackground(_ application: UIApplication) {
        print("\(Self.self).\(#function)")
    }

    /// Tells the delegate that the app is about to enter the foreground.
    /// - Parameter application: Your singleton app object.
    public func applicationWillEnterForeground(_ application: UIApplication) {
        print("\(Self.self).\(#function)")
    }

    // MARK: - Providing the main entry point

    /// Provides the top-level entry point for the app.
    ///
    /// UIApplicationDelegate provides an implementation of the main() method so that it can serve as the main entry point for a UIKit app.
    /// The system calls the main() method to launch your app; you never call it yourself.
    /// You can have exactly one entry point in your app, which you mark with the @main attribute.
    @MainActor static func main() {
        
    }
}

extension UIApplication {

    /// The keys you use to access values in the launch options dictionary that the system passes to your app at initialization.
    public struct LaunchOptionsKey : Hashable, RawRepresentable, Sendable {

        // The raw type that can be used to represent all values of the conforming
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
        public var rawValue: Self.RawValue

        /// Creates a launch options key with the specified raw value.
        ///
        /// If there is no value of the type that corresponds with the specified raw
        /// value, this initializer returns `nil`. For example:
        ///
        ///     enum PaperSize: String {
        ///         case A4, A5, Letter, Legal
        ///     }
        ///
        ///     print(PaperSize(rawValue: "Legal"))
        ///     // Prints "Optional("PaperSize.Legal")"
        ///
        ///     print(PaperSize(rawValue: "Tabloid"))
        ///     // Prints "nil"
        ///
        /// - Parameter rawValue: The raw value to use for the new instance.
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}

extension UIApplication {

    /// A notification that posts immediately after the app finishes launching.
    public static let didFinishLaunchingNotification = Notification.Name("UIApplicationDidFinishLaunchingNotification")

    /// A notification that posts when the app becomes active.
    public static let didBecomeActiveNotification = NSNotification.Name("UIApplicationDidBecomeActiveNotification")

    /// A notification that posts when the app enters the background.
    public static let didEnterBackgroundNotification = NSNotification.Name("UIApplicationDidEnterBackgroundNotification")

    /// A notification that posts shortly before an app leaves the background state on its way to becoming the active app.
    public static let willEnterForegroundNotification = NSNotification.Name("UIApplicationWillEnterForegroundNotification")

    /// A notification that posts when the app is no longer active and loses focus.
    public static let willResignActiveNotification = NSNotification.Name("UIApplicationWillResignActiveNotification")

    /// A notification that posts when the app is about to terminate.
    public static let willTerminateNotification = NSNotification.Name("UIApplicationWillTerminateNotification")
}

extension UIApplication {

    /// Constants that indicate the running states of an app.
    @frozen public enum State : String, Equatable, Sendable {

        // MARK: - Constants
        /// The app is running in the foreground and currently receiving events.
        case active

        /// The app is running in the foreground but isn’t receiving events.
        case inactive

        /// The app is running in the background.
        case background
    }
}

extension UIApplication {
    struct UISceneManifest {
        // Enable Multiple Windows
        let supportsMultipleScenes: Bool?
        // Scene Configuration
        let configurations: [String: [UISceneConfiguration]]?
    }
}

extension UIApplication.UISceneManifest: Decodable {
    enum CodingKeys: String, CodingKey {
        case supportsMultipleScenes = "ApplicationSupportsMultipleScenes"
        case configurations = "SceneConfigurations"
    }
}


extension UIApplication {
    struct UIInformation {
        let scene: UIApplication.UISceneManifest?
        let principalClass: String?
    }
}

extension UIApplication.UIInformation: Decodable {
    enum CodingKeys: String, CodingKey {
        case scene = "ApplicationSceneManifest"
        case principalClass = "PrincipalClass"
    }
}
