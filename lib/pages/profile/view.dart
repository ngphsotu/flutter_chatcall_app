import '/lib.dart';
import 'index.dart';
import '/common/common.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfilePhoto(),
                    _buildCompleteBtn(),
                    _buildLogoutBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // * Appbar
  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Profile',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  // * Profile Photo
  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.all(Radius.circular(60.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.1),
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Image(
            width: 120.w,
            height: 120.h,
            fit: BoxFit.cover,
            image: const AssetImage('assets/images/account_header.png'),
          ),
        ),
        Positioned(
          right: 0.w,
          bottom: 0.w,
          height: 35.w,
          child: GestureDetector(
            onTap: () {},
            child: Container(
                width: 35.w,
                height: 35.w,
                padding: EdgeInsets.all(7.w),
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.all(Radius.circular(40.w)),
                ),
                child: Image.asset('assets/icons/edit.png')),
          ),
        ),
      ],
    );
  }

  // * Buttom Complete
  Widget _buildCompleteBtn() {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print('Tap Complete Button');
        }
      },
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Complete',
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutBtn() {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: 'Are you sure to log out ?',
          content: Container(),
          textCancel: 'Cancel',
          textConfirm: 'Confirm',
          confirmTextColor: Colors.white,
          onCancel: () {},
          onConfirm: () {
            controller.goLogout();
            if (kDebugMode) {
              print('... It\'s confirmed logout ...');
            }
          },
        );
      },
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 0.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElementText,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logout',
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
