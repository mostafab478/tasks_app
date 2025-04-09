import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoute(RouteSettings settings) => null;

class MagicRouter {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey<ScaffoldMessengerState>();
  static BuildContext currentContext = navigatorState.currentContext!;

  static Future<dynamic> navigateTo(Widget page) => navigatorState.currentState!.push(_materialPageRoute(page));

  static Future<dynamic> navigateAndPopAll(Widget page) => navigatorState.currentState!.pushAndRemoveUntil(_materialPageRoute(page), (_) => false);

  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) => navigatorState.currentState!.pushAndRemoveUntil(_materialPageRoute(page), (route) => route.isFirst);

  static Future<dynamic> navigateAndPop(Widget page) => navigatorState.currentState!.pushReplacement(_materialPageRoute(page));

  static void pop() => navigatorState.currentState!.pop();

  static Route<dynamic> _materialPageRoute(Widget page) {
    return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: page,
          );
        },
      );
  }
}
