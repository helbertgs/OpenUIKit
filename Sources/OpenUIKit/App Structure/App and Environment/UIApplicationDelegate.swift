import Foundation

/// A set of methods to manage shared behaviors for your app.
@MainActor public protocol UIApplicationDelegate : AnyObject {

    // MARK: - Initializing the app

    /// Tells the delegate that the launch process has begun but that state restoration hasn’t occured.
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - launchOptions: A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly. For information about the possible keys in this dictionary and how to handle them, see UIApplication.LaunchOptionsKey.
    /// - Returns: false if the app cannot handle the URL resource or continue a user activity, or if the app should not perform the application(_:performActionFor:completionHandler:) method because you’re handling the invocation of a Home screen quick action in this method; otherwise return true. The return value is ignored if the app is launched as a result of a remote notification.
    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool

    /// Tells the delegate that the launch process is almost done and the app is almost ready to run.
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - launchOptions: A dictionary indicating the reason the app was launched (if any). The contents of this dictionary may be empty in situations where the user launched the app directly. For information about the possible keys in this dictionary and how to handle them, see UIApplication.LaunchOptionsKey.
    /// - Returns: false if the app cannot handle the URL resource or continue a user activity, otherwise return true. The return value is ignored if the app is launched as a result of a remote notification.
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool

    // MARK: - Configuring and discarding scenes

    /// Retrieves the configuration data for UIKit to use when creating a new scene.
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - connectingSceneSession: The session object associated with the scene. This object contains the initial configuration data loaded from the app’s Info.plist file, if any.
    ///   - options: System-specific options for configuring the scene.
    /// - Returns: The configuration object containing the information needed to create the scene.
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration


    /// Tells the delegate that the user closed one or more of the app’s scenes from the app switcher.
    /// - Parameters:
    ///   - application: The singleton app object.
    ///   - sceneSessions: The session objects associated with the discarded scenes.
    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    )

    // MARK: - Responding to app life-cycle events

    /// Tells the delegate that the app has become active.
    /// - Parameter application: Your singleton app object.
    func applicationDidBecomeActive(_ application: UIApplication)

    /// Tells the delegate that the app is about to become inactive.
    /// - Parameter application: Your singleton app object.
    func applicationWillResignActive(_ application: UIApplication)

    /// Tells the delegate that the app is now in the background.
    /// - Parameter application: Your singleton app object.
    func applicationDidEnterBackground(_ application: UIApplication)

    /// Tells the delegate that the app is about to enter the foreground.
    /// - Parameter application: Your singleton app object.
    func applicationWillEnterForeground(_ application: UIApplication)

    /// Tells the delegate when the app is about to terminate.
    /// - Parameter application: Your singleton app object.
    func applicationWillTerminate(_ application: UIApplication)

    // MARK: - Providing the main entry point

    /// Provides the top-level entry point for the app.
    ///
    /// UIApplicationDelegate provides an implementation of the main() method so that it can serve as the main entry point for a UIKit app.
    /// The system calls the main() method to launch your app; you never call it yourself. You can have exactly one entry point in your app, which you mark with the @main attribute.
    @MainActor @preconcurrency static func main()

    // MARK: - Create an App delegate

    init()
}

extension UIApplicationDelegate {
    // MARK: - Initializing the app

    public func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
            true
        }

    // MARK: - Configuring and discarding scenes

    public func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        .init(name: nil, sessionRole: .windowApplication)
    }

    public func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        print(#function)
    }

    // MARK: - Responding to app life-cycle events

    public func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }

    public func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }

    public func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
    }

    public func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
    }

    public func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }
}

extension UIApplicationDelegate {
    /// Provides the top-level entry point for the app.
    ///
    /// UIApplicationDelegate provides an implementation of the main() method so that it can serve as the main entry point for a UIKit app.
    /// The system calls the main() method to launch your app; you never call it yourself. You can have exactly one entry point in your app, which you mark with the @main attribute.
    @MainActor @preconcurrency
    public static func main() {
        UIApplicationMain(
            CommandLine.argc,
            CommandLine.unsafeArgv,
            NSStringFromClass(UIApplication.self),
            NSStringFromClass(Self.self)
        )
    }
}
