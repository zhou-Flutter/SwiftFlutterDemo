import Flutter
import UIKit

class HomeViewController: UIViewController {
    private let buttonView: UIButton = {
        let button = UIButton()
        button.setTitle("原生页面, 点击打开 Flutter 页面", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        buttonView.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)

        setupView()
    }

    func setupView() {
        view.addSubview(buttonView)
        NSLayoutConstraint.activate([
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc private func buttonClick() {
        FlutterSingleEngineManager.shared.pushFlutterPage(route: "/home")
    }
}
