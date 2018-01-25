//
//import UIKit
//import
//struct CustomSwiftToast: SwiftToastProtocol {
//    // Protocoled
//    var duration: Double?
//    var minimumHeight: CGFloat?
//    var aboveStatusBar: Bool
//    var statusBarStyle: UIStatusBarStyle
//    var isUserInteractionEnabled: Bool
//    var target: SwiftToastDelegate?
//    var style: SwiftToastStyle
//
//    // Customized
//    var title: String
//    var subtitle: String
//    var backgroundColor: UIColor
//}
//
//class CustomSwiftToastView: UIView, SwiftToastViewProtocol {
//
//    // Customized
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var subtitleLabel: UILabel!
//    @IBOutlet weak var viewMinimumHeightConstraint: NSLayoutConstraint!
//
//    // Protocoled
//    func nib() -> SwiftToastViewProtocol? {
//        return Bundle.main.loadNibNamed("CustomSwiftToastView", owner: self, options: nil)?.first as? CustomSwiftToastView
//    }
//    
//    func configure(with toast: SwiftToastProtocol) {
//        if let customToast = toast as? CustomSwiftToast {
//
//            // Put your configure code here. e.g.:
//
//            // subtitleLabel.text = customToast.subtitle
//            // backgroundColor = customToast.backgroundColor
//
//            // Setup minimum height if needed
//
//            // if let minimumHeight = toast.minimumHeight {
//            //    viewMinimumHeightConstraint.constant = minimumHeight
//            // }
//        }
//    }
//}

