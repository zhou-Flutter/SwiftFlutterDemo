// 自定义 NavigatorObserver
import 'package:flutter/material.dart';

ValueNotifier<bool> canPopNotifier = ValueNotifier<bool>(false);

class RouteObserverService extends NavigatorObserver {
  final List<Route<dynamic>> _routeStack = [];

  List<Route<dynamic>> get routeStack => List.unmodifiable(_routeStack);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _routeStack.add(route);
    checkCanPop();
    print('Pushed route: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    _routeStack.remove(route);
    checkCanPop();
    print('Popped route: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _routeStack.remove(route);
    checkCanPop();
    print('Removed route: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) _routeStack.remove(oldRoute);
    if (newRoute != null) _routeStack.add(newRoute);
    checkCanPop();
    print(
      'Replaced route: ${oldRoute?.settings.name} with ${newRoute?.settings.name}',
    );
  }

  void checkCanPop() {
    print('checkCanPop: ${_routeStack.length}');
    canPopNotifier.value = _routeStack.length > 1;
  }
}
