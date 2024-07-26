import OpenUIKit

@main
public class ApplicationDelegate : UIObject, UIApplicationDelegate {

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print("\(Self.self).\(#function)")
        return true
    }

    public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        print("\(Self.self).\(#function)")
        let sceneConfiguration = UISceneConfiguration(name: "Default Configuration", sessionRole: .windowApplication)
        sceneConfiguration.delegateClass = SceneDelegate.self

        return sceneConfiguration
    }
    
    public func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        print("\(Self.self).\(#function)")
    }
}
