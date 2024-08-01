import Foundation

/// Information about the objects and storyboard for UKit to use when creating a particular scene.
@MainActor
public class UISceneConfiguration : Decodable {

    // MARK: - Specifying the scene creation details

    /// The class of the scene object that you want UIKit to create.
    public var sceneClass: AnyClass?

    /// The class of the custom delegate object that you want UIKit to create.
    public var delegateClass: AnyClass?

    // MARK: - Getting the configuration attributes

    /// The app-specific name assigned to the scene configuration.
    public var name: String?

    /// The role assigned to the scene configuration.
    public var role: UISceneSession.Role

    /// Creates a scene-configuration object with the specified role and app-specific name.
    /// - Parameters:
    ///   - name: The app-specific name you want to assign to the scene. For scenes you specify in your Info.plist file, this value corresponds to the string assigned to the UISceneConfigurationName key.
    ///   - sessionRole: The role of the scene. For a list of possible roles, see UISceneSession.Role.
    public init(name: String?, sessionRole role: UISceneSession.Role) {
        self.name = name
        self.role = role
    }

    nonisolated required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.role = try container.decode(UISceneSession.Role.self, forKey: .role)
    }

    enum CodingKeys: String, CodingKey {
        case sceneClass = "class"
        case delegateClass = "delegateClass"
        case name
        case role
    }
}
