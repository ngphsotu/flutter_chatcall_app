import '/lib.dart';
import '../values/values.dart';

Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  double fontSize = 16,
  String title = 'button',
  String fontName = 'Montserrat',
  Color gbColor = AppColors.primaryElement,
  Color fontColor = AppColors.primaryElementText,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16.sp)),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused) &&
                !states.contains(MaterialState.pressed)) {
              return Colors.blue;
            } else if (states.contains(MaterialState.pressed)) {
              return Colors.deepPurple;
            }
            return fontColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue[200];
          }
          return gbColor;
        }),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(borderRadius: Radii.k6pxRadius),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          height: 1,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}

Widget btnFlatButtonBorderOnlyWidget({
  double width = 88,
  double height = 44,
  required String iconFileName,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        )),
        // textStyle: MaterialStateProperty.all(TextStyle(
        //   fontSize: 16.sp,
        // )),
        // foregroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.focused) &&
        //         !states.contains(MaterialState.pressed)) {
        //       return Colors.blue;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.deepPurple;
        //     }
        //     return AppColors.primaryElementText;
        //   },
        // ),
        // backgroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.pressed)) {
        //     return Colors.blue[200];
        //   }
        //   return AppColors.primaryElement;
        // }),
      ),
      child: Image.asset('assets/images/icons-$iconFileName.png'),
    ),
  );
}