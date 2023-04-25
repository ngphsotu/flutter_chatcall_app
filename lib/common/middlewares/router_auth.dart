// ignore_for_file: overridden_fields

import '/lib.dart';
import '../store/store.dart';
import '../routes/routes.dart';

// Check if the user has logged in
class RouteAuthMiddleware extends GetMiddleware {
  // Priority smaller the better
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (UserStore.to.isLogin ||
        route == AppRoutes.SIGN_IN ||
        route == AppRoutes.INITIAL ||
        route == AppRoutes.MESSAGE) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar('Tips', 'Login expired, please login again!'));
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
// * || route == AppRoutes.MESSAGE