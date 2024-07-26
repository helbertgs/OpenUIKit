import Foundation

/// The core methods you use to respond to life-cycle events occurring within a scene.
@MainActor
public protocol UISceneDelegate : UIObjectProtocol {

    // MARK: - Connecting and disconnecting the scene
    
    /// Tells the delegate about the addition of a scene to the app.
    /// - Parameters:
    ///   - scene: The scene object being connected to your app.
    ///   - session: The session object containing details about the scene's configuration.
    ///   - connectionOptions: Additional options for configuring the scene. Use the information in this object to handle actions that caused the creation of the scene, for example, to respond to a quick action selected by the user.
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    )

    /// Tells the delegate that UIKit removed a scene from your app.
    /// - Parameter scene: The scene that UIKit disconnected from your app.
    func sceneDidDisconnect(_ scene: UIScene)

    // MARK: - Transitioning to the foreground

    /// Tells the delegate that the scene is about to begin running in the foreground and become visible to the user.
    /// - Parameter scene: The scene that is about to enter the foreground.
    func sceneWillEnterForeground(_ scene: UIScene)
    
    /// Tells the delegate that the scene became active and is now responding to user events.
    /// - Parameter scene: The scene that became active and is now responding to user events.
    func sceneDidBecomeActive(_ scene: UIScene)

    // MARK: - Transitioning to the background

    /// Tells the delegate that the scene is about to resign the active state and stop responding to user events.
    /// - Parameter scene: The scene that is about to stop responding to user events.
    func sceneWillResignActive(_ scene: UIScene)
    
    /// Tells the delegate that the scene is running in the background and is no longer onscreen.
    /// - Parameter scene: The scene that entered the background.
    func sceneDidEnterBackground(_ scene: UIScene)
}
