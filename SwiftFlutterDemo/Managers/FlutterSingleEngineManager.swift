import Flutter
import UIKit

class FlutterSingleEngineManager {
    static let shared: FlutterSingleEngineManager = .init()

    private(set) var engine: FlutterEngine?

    private init() {
        engine = FlutterEngine(name: "my_single_engine")
        engine?.run()
    }

    /// 通过路由打开 Flutter 页面
    func pushFlutterPage(
        route: String? = nil,
        isHiddenNavigation: Bool = true
    ) {
        guard let engine = engine else {
            print("❌ FlutterEngine 未初始化")
            return
        }

        let flutterVC = SingleFlutterViewController(
            engine: engine, route: route,
            isHiddenNavigation: isHiddenNavigation,
        )

        AppRouter.nav?.pushViewController(flutterVC, animated: true)

    }

    /// 销毁 Flutter 引擎（一般 App 生命周期结束时调用）
    func destroyEngine() {
        engine?.destroyContext()
        engine = nil
    }
}
