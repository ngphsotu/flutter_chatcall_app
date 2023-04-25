import '/lib.dart';
import 'index.dart';
import '/common/common.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryElement,
      body: SizedBox(
        width: 360.w,
        height: 780.h,
        child: _buildPageHeadtitle(controller.title),
      ),
    );
  }
}

Widget _buildPageHeadtitle(String title) {
  return Container(
    margin: const EdgeInsets.only(top: 350),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primaryElementText,
        fontSize: 45.sp,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
