import 'package:create_base/app/routers/router_name.dart';
import 'package:create_base/presentation/pages/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router =
      GoRouter(initialLocation: RouterName.splashScreen, routes: [
    GoRoute(
      path: RouterName.splashScreen,
      name: RouterName.splashScreen,
      builder: (context, state) => const SplashScreen(),
    )
  ]);
}
