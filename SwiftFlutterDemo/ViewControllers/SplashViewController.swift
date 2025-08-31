//
//  SplashViewController.swift
//  project_01
//
//  Created by yk on 2025/7/14.
//

import UIKit

class SplashViewController: UIViewController {

    // 启动图标
    private let icon: UILabel = {
        let view = UILabel()
        view.text = "启动页"
        view.textAlignment = .center
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.textColor = .black
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        startApp()
    }

    func setupView() {
        view.addSubview(icon)
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.heightAnchor.constraint(equalToConstant: 30),
            icon.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            icon.topAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    func startApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let mainVC = MainViewController()
            self.navigationController?.setViewControllers([mainVC], animated: false)

        }
    }

}
