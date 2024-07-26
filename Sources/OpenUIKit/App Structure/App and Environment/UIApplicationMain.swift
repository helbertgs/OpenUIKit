import Foundation
import CGLFW3

/// Creates the application object and the application delegate and sets up the event cycle.
/// - Parameters:
///   - argc: The count of arguments in argv; this usually is the corresponding parameter to main.
///   - argv: A variable list of arguments; this usually is the corresponding parameter to main.
///   - principalClassName: The name of the UIApplication class or subclass. If you specify nil, UIApplication is assumed.
///   - delegateClassName: The name of the class from which the application delegate is instantiated.
///   If principalClassName designates a subclass of UIApplication, you may designate the subclass as the delegate; the subclass instance receives the application-delegate messages.
///   Specify nil if you load the delegate object from your application’s main nib file.
/// - Returns: Even though an integer return type is specified, this function never returns.
@MainActor
@discardableResult
public func UIApplicationMain(
    _ argc: Int32,
    _ argv: UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>,
    _ principalClassName: String?,
    _ delegateClassName: String?
) -> Int32 {
    print("\(#function)")

    if glfwInit() == GLFW_FALSE {
        print("GLFW not initialized")
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 3);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    #if os(macOS)
        glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    #endif

    var information: UIApplication.UIInformation?
    if let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
       let contents = FileManager.default.contents(atPath: path) {
        information = try? PropertyListDecoder().decode(UIApplication.UIInformation.self,
                                                        from: contents)
    }

    // Setup the main application class.  The following order describes how the
    // user may actually configure the selected class:
    //
    //    1. `application`: the parameter passd to `ApplicationMain(_:_:_:_:)`
    //    2. `PrincipalClass`: the value configured in `Info.plist`
    //    3. `Application`: the default application class provided by Swift/Win32
    //
    // We must have an application class to instantiate as this is the main entry
    // point which is executed by this framework.
    let application = principalClassName ?? (information?.principalClass ?? NSStringFromClass(UIApplication.self))
    guard let instance = NSClassFromString(application) else {
        fatalError("unable to find application class \(application)")
    }

    UIApplication.shared = (instance as! UIApplication.Type).init()

    // Setup the application's information which was loaded.  Because the
    // configuration can indicate the principal class it is loaded prior to the
    // construction of the shared application's construction.  Now that the
    // application has been construted, we can instill the configuration.
    UIApplication.shared.information = information

    // Setup the application's delegate.
    if let delegate = delegateClassName {
        guard let instance = NSClassFromString(delegate) else {
            fatalError("unable to find delegate class: \(delegate)")
        }
        if instance as? UIApplication.Type == nil {
            UIApplication.shared.delegate = (instance as! UIApplicationDelegate.Type).init()
        } else {
            UIApplication.shared.delegate = UIApplication.shared as? UIApplicationDelegate
        }
    }

    if UIApplication
        .shared
        .delegate?
        .application(UIApplication.shared,
                     willFinishLaunchingWithOptions: nil) == false {
        return 0
    }

    if UIApplication
        .shared
        .delegate?
        .application(UIApplication.shared,
                     didFinishLaunchingWithOptions: nil) == false {
        return 0
    }

    // Post ApplicationDelegate.didFinishLaunchingNotification
    NotificationCenter.default
        .post(name: UIApplication.didFinishLaunchingNotification,
              object: nil, userInfo: nil)

    UIApplication
        .shared
        .delegate?
        .applicationDidBecomeActive(UIApplication.shared)

    // Setup the scene session.
    let (_, session) = UIApplication
        .shared
        .openSessions
        .insert(UISceneSession(configuration: .init(name: nil, sessionRole: .windowApplication), persistentIdentifier: UUID().uuidString))

    // Update the scene configuration based on the delegate's response.
    if let configuration = UIApplication
        .shared
        .delegate?
        .application(UIApplication.shared, configurationForConnecting: session, options: .init()) {
        session.configuration = configuration
    }

    // Create the scene.
    let SceneType = (session.configuration.sceneClass as? UIScene.Type) ?? UIWindowScene.self

    let (_, scene) = UIApplication.shared.connectedScenes
        .insert(SceneType.init(session: session, connectionOptions: .init()))


    if let DelegateType =
        session.configuration.delegateClass as? UISceneDelegate.Type {
        // Only instantiate the scene delegate if the scene delegate is not the
        // Application class or the ApplicationDelegate class.
        if DelegateType as? UIApplication.Type == nil {
            if DelegateType as? UIApplicationDelegate.Type == nil {
                scene.delegate = DelegateType.init()
            } else {
                scene.delegate = UIApplication.shared.delegate as? UISceneDelegate
            }
        } else {
            scene.delegate = UIApplication.shared as? UISceneDelegate
        }
    }

    scene.delegate?.scene(scene, willConnectTo: session, options: .init())
    session.scene = scene

    mainLoop: while true {
        UIApplication.shared.connectedScenes.forEach {
            if let scene = $0 as? UIWindowScene? {
                scene?.keyWindow?.draw()
            }
        }

        glfwPollEvents()
    }

    UIApplication
        .shared
        .delegate?
        .applicationWillTerminate(UIApplication.shared)

    glfwTerminate()

    return 1
}
