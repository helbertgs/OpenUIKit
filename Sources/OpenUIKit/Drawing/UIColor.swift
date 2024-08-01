import Foundation

/// An object that stores color data and sometimes opacity.
public class UIColor {

    internal var red: Float
    internal var green: Float
    internal var blue: Float
    internal var alpha: Float

    // MARK: - Creating a color from component values

    /// Creates a color object using the specified opacity and RGB component values.
    /// - Parameters:
    ///   - red: The red value of the color object.
    ///   - green: The green value of the color object.
    ///   - blue: The blue value of the color object.
    ///   - alpha: The opacity value of the color object.
    /// - Return: The color object. The color information represented by this object is in an RGB colorspace.
    public init(red: Float, green: Float, blue: Float, alpha: Float = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }

    /// Creates a color object using the specified opacity and HSB color space component values.
    /// - Parameters:
    ///   - hue: The hue value of the color object.
    ///   - saturation: The saturation value of the color object.
    ///   - brightness: The brightness value of the color object.
    ///   - alpha: The opacity value of the color object.
    /// - Return: The color object. The color information represented by this object is in an RGB colorspace.
    // public init(hue: Float, saturation: Float, brightness: Float, alpha: Float) {

    // }
}

extension UIColor {

    public static var black : UIColor {
        .init(red: 0, green: 0, blue: 0)
    }

    public static var red : UIColor {
        .init(red: 1, green: 0, blue: 0)
    }

    public static var green : UIColor {
        .init(red: 0, green: 1, blue: 0)
    }

    public static var blue : UIColor {
        .init(red: 0, green: 0, blue: 1)
    }
}