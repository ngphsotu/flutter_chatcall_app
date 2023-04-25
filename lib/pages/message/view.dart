import '/lib.dart';
import 'index.dart';
import '/common/common.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: _headBar(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.w,
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.goProfile();
                    if (kDebugMode) {
                      print('Tap avatar, go to Profile Page');
                    }
                  },
                  child: Container(
                    width: 44.h,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.primarySecondaryBackground,
                      borderRadius: BorderRadius.all(Radius.circular(22.h)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: controller.state.head_detail.value.avatar == null
                        ? Image.asset('assets/images/account_header.png')
                        : const Text('Hi'),
                  ),
                ),
                Positioned(
                  right: 0.w,
                  bottom: 5.w,
                  height: 14.w,
                  child: Container(
                    width: 14.w,
                    height: 14.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.w,
                        color: AppColors.primaryElementText,
                      ),
                      color: AppColors.primaryElementStatus,
                      borderRadius: BorderRadius.all(Radius.circular(12.w)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
