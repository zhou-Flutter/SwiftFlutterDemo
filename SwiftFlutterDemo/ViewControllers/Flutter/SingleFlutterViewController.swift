import Flutter
import UIKit

class SingleFlutterViewController: FlutterViewController {

    private var methodChannel: FlutterMethodChannel?

    private var isHiddenNavigation: Bool = true

    /// 自定义初始化方法
    init(engine: FlutterEngine, route: String? = nil, isHiddenNavigation: Bool = true) {
        super.init(engine: engine, nibName: nil, bundle: nil)

        self.isHiddenNavigation = isHiddenNavigation
        registerMethodChannel()

        settingRoute(route: route)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    /// 注册 MethodChannel
    func registerMethodChannel() {

        methodChannel = FlutterMethodChannel(
            name: "page_method_channel",
            binaryMessenger: self.binaryMessenger
        )

        methodChannel?.setMethodCallHandler { call, result in

            switch call.method {
            case "activePopGesture":

                if let boolValue = call.arguments as? Bool {
                    print("📩 收到 Flutter 消息: \(call.method), 参数: \(boolValue)")
                    // // 禁用滑动返回
                    self.navigationController?.interactivePopGestureRecognizer?.isEnabled =
                        !boolValue
                }
                return
            case "popNativePage":
                self.navigationController?.popViewController(animated: true)
                return

            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }

    func settingRoute(route: String? = nil) {
        print("📲 发送 Flutter 消息: settingRoute, 参数: \(route ?? "/")")

        methodChannel?.invokeMethod("settingRoute", arguments: route ?? "/")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 处理导航栏隐藏
        if isHiddenNavigation {
            navigationController?.setNavigationBarHidden(true, animated: false)
        }

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if isHiddenNavigation {
            navigationController?.setNavigationBarHidden(false, animated: animated)
        }

        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        methodChannel?.invokeMethod("settingRoute", arguments: "/")
    }

}
