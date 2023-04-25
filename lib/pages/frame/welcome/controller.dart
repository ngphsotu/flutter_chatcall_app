import '/lib.dart';
import 'state.dart';
import '/common/common.dart';

class WelcomeController extends GetxController {
  final title = 'Chatcall';
  final state = WelcomeState();

  WelcomeController();

  @override
  void onReady() {
    super.onReady();
    // print('WelcomeController');
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed(AppRoutes.MESSAGE),
    );
  }
}
