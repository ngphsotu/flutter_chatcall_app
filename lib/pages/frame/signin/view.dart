// ignore_for_file: avoid_print

import '/lib.dart';
import 'index.dart';
import '/common/common.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildThirdPartyLogin(
              'Google',
              'google',
              () {
                print('Tap Google Container');
              },
            ),
            _buildThirdPartyLogin(
              'Facebook',
              'facebook',
              () {
                print('Tap Facebook Container');
              },
            ),
            _buildThirdPartyLogin(
              'Apple',
              'apple',
              () {
                print('Tap Apple Container');
              },
            ),
            _buildOrWidget(),
            _buildThirdPartyLogin(
              'phone number',
              '',
              () {
                print('Tap phone number Container');
              },
            ),
            SizedBox(height: 35.h),
            _buildSignUpWidget(),
          ],
        ),
      ),
    );
  }
}

Widget _buildLogo() {
  return Container(
    margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
    child: Text(
      'Chatcall',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColor.primaryText,
        fontSize: 34.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildThirdPartyLogin(
  String loginTitle,
  String logo,
  Function() onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 295.w,
      height: 44.h,
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            offset: const Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment:
            logo == '' ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          logo == ''
              ? Container()
              : Container(
                  padding: EdgeInsets.only(left: 40.w, right: 30.w),
                  child: Image.asset('assets/icons/$logo.png'),
                ),
          Text(
            'Sign in with $loginTitle',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColor.primaryText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildOrWidget() {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 25.h),
    child: Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.primarySecondaryElementText,
            height: 2.h,
            indent: 50,
          ),
        ),
        const Text('   or   '),
        Expanded(
          child: Divider(
            color: AppColors.primarySecondaryElementText,
            height: 2.h,
            endIndent: 50,
          ),
        ),
      ],
    ),
  );
}

Widget _buildSignUpWidget() {
  return GestureDetector(
    onTap: () {
      print('... sign up from here ...');
    },
    child: Column(
      children: [
        Text(
          'Already have an account ?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          'Sign up here',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryElement,
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
  );
}
