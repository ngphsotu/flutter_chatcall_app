import '/lib.dart';
import 'state.dart';
import '/common/common.dart';

class MessageController extends GetxController {
  final state = MessageState();

  MessageController();

  Future<void> goProfile() async {
    await Get.toNamed(AppRoutes.PROFILE);
  }
}
