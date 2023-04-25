// ignore_for_file:  overridden_fields

import '/lib.dart';
import '../common.dart';

class RouteWelcomeMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteWelcomeMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (kDebugMode) {
      print(ConfigStore.to.isFirstOpen);
    }
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.MESSAGE);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
