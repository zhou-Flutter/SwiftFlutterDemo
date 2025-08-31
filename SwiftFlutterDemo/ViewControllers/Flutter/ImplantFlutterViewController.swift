import Flutter
import UIKit

class ImplantFlutterViewController: UIViewController {

    var flutterVC: FlutterViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flutter"

        setupFlutterView()
    }

    func setupFlutterView() {

        // guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        // let flutterVC = FlutterViewController(
        //     engine: appDelegate.flutterEngine, nibName: nil, bundle: nil)

        // self.flutterVC = flutterVC

        // addChild(flutterVC)
        // view.addSubview(flutterVC.view)
        // flutterVC.view.translatesAutoresizingMaskIntoConstraints = false

        // NSLayoutConstraint.activate([
        //     flutterVC.view.topAnchor.constraint(equalTo: view.topAnchor),
        //     flutterVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        //     flutterVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        //     flutterVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        // ])

        // flutterVC.didMove(toParent: self)

    }

    // deinit {
    //     flutterVC?.willMove(toParent: nil)
    //     flutterVC?.view.removeFromSuperview()
    //     flutterVC?.removeFromParent()

    //     if let engine = flutterVC?.engine {
    //         engine.viewController = nil
    //     }
    // }
}
