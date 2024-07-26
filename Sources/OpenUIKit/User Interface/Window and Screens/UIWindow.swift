import Foundation
import CGLFW3
import OpenGL

/// The backdrop for your app’s user interface and the object that dispatches events to your views.
@MainActor public class UIWindow {

    // MARK: - Internal Property(ies)

    private var _window: OpaquePointer?

    // MARK: - Getting related objects

    /// The scene containing the window.
    public weak var windowScene: UIWindowScene?

    // MARK: - Configuring the window

    /// The root view controller for the window.
    public var rootViewController: UIViewController?

    // MARK: - Creating a window

    /// Creates a window and associates it with the specified scene object.
    /// - Parameter windowScene: The scene object in which to display the window.
    public init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
        self._window = glfwCreateWindow(900, 450, "Window", nil, nil)
        glViewport(0, 0, 900, 450)
    }

    // MARK: - Making windows key
    
    /// Shows the window and makes it the key window.
    ///
    /// This is a convenience method to show the current window and position it in front of all other windows at the same level or lower.
    /// If you only want to show the window, change its isHidden property to false.
    public func makeKeyAndVisible() {
        print("\(Self.self).\(#function)")
        windowScene?.keyWindow = self

        if let window = _window {
            glfwMakeContextCurrent(window)
        }
    }

    public func draw() {
        print("\(Self.self).\(#function)")
        if let window = _window {
            glClearColor(0.2, 0.3, 0.3, 1)
            glClear(UInt32(GL_COLOR_BUFFER_BIT))
            glfwSwapBuffers(window)
        }
    }

    public func close() {
        print("\(Self.self).\(#function)")
        if let window = self._window {
            glfwSetWindowShouldClose(window, GL_TRUE)
        }
    }
}
