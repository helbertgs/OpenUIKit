import Foundation

open class UIViewController {
    
    /// Creates a view controller with the nib file in the specified bundle.
    /// - Parameters:
    ///   - nibNameOrNil: The name of the nib file to associate with the view controller. The nib file name should not contain any leading path information. If you specify nil, the nibName property is set to nil.
    ///   - nibBundleOrNil: The bundle in which to search for the nib file. This method looks for the nib file in the bundle's language-specific project directories first, followed by the Resources directory.
    public init (
        nibName nibNameOrNil: String? = nil,
        bundle nibBundleOrNil: Bundle? = nil
    ) { }
}
