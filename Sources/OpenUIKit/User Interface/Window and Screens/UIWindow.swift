import Foundation
import CoreGraphics
import GLAD

/// The backdrop for your app’s user interface and the object that dispatches events to your views.
@MainActor public class UIWindow : UIView {

    // MARK: - Internal Property(ies)

    internal var glfwWindow: OpaquePointer?

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
        self.glfwWindow = glfwCreateWindow(900, 450, "Window", nil, nil)

        super.init(frame: .zero)

        if let window = glfwWindow {
            glfwSetWindowPosCallback(window, { win, x, y in
                self.frame.origin = Point(x: Double(x), y: Double(y))
            })
        }
    }

    // MARK: - Making windows key
    
    /// Shows the window and makes it the key window.
    ///
    /// This is a convenience method to show the current window and position it in front of all other windows at the same level or lower.
    /// If you only want to show the window, change its isHidden property to false.
    public func makeKeyAndVisible() {
        print("\(Self.self).\(#function)")
        windowScene?.keyWindow = self

        if let window = glfwWindow {
            glfwMakeContextCurrent(window)
        }
    }

    public func draw() {
        print("\(Self.self).\(#function)")
        if let window = glfwWindow {
            let color = backgroundColor ?? UIColor.black

            glad_glClearColor(color.red, color.green, color.blue, color.alpha)
            glad_glClear(UInt32(GL_COLOR_BUFFER_BIT))
            glfwSwapBuffers(window)
        }
    }

    public func close() {
        print("\(Self.self).\(#function)")
        if let window = self.glfwWindow {
            glfwSetWindowShouldClose(window, GL_TRUE)
        }
    }
}
