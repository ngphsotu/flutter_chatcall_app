import '/lib.dart';
import 'state.dart';
import '/common/common.dart';

class SignInController extends GetxController {
  final state = SignInState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  SignInController();

  // * Handle Sign In
  Future<void> handleSignIn(String type) async {
    // 1: Email, 2: Google, 3: Facebook, 4: Apple, 5: Phone
    try {
      if (type == 'phone number') {
        if (kDebugMode) {
          print('... you are logging in with phone number ...');
        }
      } else if (type == 'google') {
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String id = user.id;
          String email = user.email;
          String? displayName = user.displayName;
          String photoUrl = user.photoUrl ?? 'assets/icons/google.png';
          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.openId = id;
          loginPanelListRequestEntity.type = 2;
          asyncPostAllData();
        }
      } else {
        if (kDebugMode) {
          print('... login type not sure ...');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('... error with login $e');
      }
    }
  }

  // * Post All Data
  asyncPostAllData() {
    Get.offAllNamed(AppRoutes.MESSAGE);
  }
}
