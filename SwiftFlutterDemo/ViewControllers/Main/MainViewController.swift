import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        self.delegate = self
        // 创建子视图控制器
        let homeVC = HomeViewController()
        let settingsVC = SettingsViewController()

        // 嵌套导航控制器（可选）
        let homeNav = UINavigationController(rootViewController: homeVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)

        // 设置 TabBar 图标和标题
        homeNav.tabBarItem = UITabBarItem(
            title: "Home", image: UIImage(systemName: "house"), tag: 0)
        settingsNav.tabBarItem = UITabBarItem(
            title: "Settings", image: UIImage(systemName: "gearshape"), tag: 1)

        // 添加到 TabBarController
        viewControllers = [homeNav, settingsNav]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
