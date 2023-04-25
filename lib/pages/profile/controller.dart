import '/lib.dart';
import 'state.dart';
import '/common/common.dart';

class ProfileController extends GetxController {
  final state = ProfileState();

  ProfileController();

  Future<void> goLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
