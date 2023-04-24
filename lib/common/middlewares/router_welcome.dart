// ignore_for_file: avoid_print, overridden_fields

import '/lib.dart';
import '../store/store.dart';
import '../routes/routes.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    print(ConfigStore.to.isFirstOpen);
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.MESSAGE);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
