import Foundation

public class UIWindowScene : UIScene {

    // MARK: - Getting the active windows

    /// The windows associated with the scene.
    public var windows: [UIWindow] = []

    /// The key window associated with the scene.
    public internal(set) var keyWindow: UIWindow?

    public required init(session: UISceneSession, connectionOptions options: UIScene.ConnectionOptions) {
        super.init(session: session, connectionOptions: options)
    }
}
