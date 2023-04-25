// ignore_for_file: constant_identifier_names

import '/lib.dart';
import '../common.dart';
import '/pages/pages.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];
  static final List<GetPage> routes = [
    //  About boot up the app
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),

    // SignIn Page
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),

    //  Message Page
    GetPage(
      name: AppRoutes.MESSAGE,
      page: () => const MessagePage(),
      binding: MessageBinding(),
      middlewares: [RouteAuthMiddleware(priority: 1)],
    ),

    //  Profile Page
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),

    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),

    // GetPage(
    //   name: AppRoutes.EMAIL_LOGIN,
    //   page: () => EmailLoginPage(),
    //   binding: EmailLoginBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.SIGN_UP,
    //   page: () => RegisterPage(),
    //   binding: RegisterBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.FORGOT,
    //   page: () => ForgotPage(),
    //   binding: ForgotBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.PHONE,
    //   page: () => PhonePage(),
    //   binding: PhoneBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.SEND_CODE,
    //   page: () => SendCodePage(),
    //   binding: SendCodeBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.CONTACT,
    //   page: () => ContactPage(),
    //   binding: ContactBinding(),
    // ),

    // GetPage(
    //   name: AppRoutes.CHAT,
    //   page: () => ChatPage(),
    //   binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.PHOTO_IMG_VIEW,
    //   page: () => PhotoImgViewPage(),
    //   binding: PhotoImgViewBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.VOICE_CALL,
    //   page: () => VoiceCallViewPage(),
    //   binding: VoiceCallViewBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.VIDEO_CALL,
    //   page: () => VideoCallPage(),
    //   binding: VideoCallBinding(),
    // ),
  ];
}
