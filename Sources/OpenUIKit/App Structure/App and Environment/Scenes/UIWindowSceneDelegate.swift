import Foundation

/// Additional methods that you use to manage app-specific tasks occurring in a scene.
@MainActor public protocol UIWindowSceneDelegate : UISceneDelegate {

    // MARK: - Managing the scene’s main window

    /// The main window associated with the scene.
    var window: UIWindow? { get set }

    // MARK: - Responding to scene changes
    
    /// Notifies you when the size, orientation, or traits of a scene change.
    /// - Parameters:
    ///   - windowScene: The window scene object whose environment changed.
    ///   - previousCoordinateSpace: The previous coordinate space of the scene. Get the current coordinate space from the coordinateSpace property of the windowScene object.
    ///   - previousInterfaceOrientation: The previous interface orientation for your content. Get the current interface orientation from the interfaceOrientation property of the windowScene object.
    ///   - previousTraitCollection: The previous traits for the window. Get the current window traits from the traitCollection property of the windowScene object.
    func windowScene(
        _ windowScene: UIWindowScene,
        didUpdate previousCoordinateSpace: any UICoordinateSpace,
        interfaceOrientation previousInterfaceOrientation: UIInterfaceOrientation,
        traitCollection previousTraitCollection: UITraitCollection
    )

    // MARK: - Performing tasks


}

extension UIWindowSceneDelegate {
    public func windowScene(
        _ windowScene: UIWindowScene,
        didUpdate previousCoordinateSpace: any UICoordinateSpace,
        interfaceOrientation previousInterfaceOrientation: UIInterfaceOrientation,
        traitCollection previousTraitCollection: UITraitCollection
    ) { }
}
