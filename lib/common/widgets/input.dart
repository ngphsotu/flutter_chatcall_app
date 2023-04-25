import '/lib.dart';
import '../common.dart';

Widget inputTextEdit({
  bool readOnly = false,
  bool autofocus = false,
  bool isPassword = false,
  double height = 44,
  double marginTop = 15,
  String? hintText,
  Widget? clearWidget,
  VoidCallback? onPressed,
  TextAlign? textAlign = TextAlign.start,
  TextInputType keyboardType = TextInputType.text,
  ValueChanged<String>? onchanged,
  TextEditingController? controller,
}) {
  return Container(
    height: height.h,
    margin: EdgeInsets.only(top: marginTop.h),
    decoration: const BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      maxLines: 1,
      readOnly: readOnly,
      autofocus: autofocus,
      textAlign: textAlign ?? TextAlign.start,
      controller: controller,
      obscureText: isPassword,
      autocorrect: false,
      keyboardType: keyboardType,
      scrollPadding: EdgeInsets.zero,
      onTap: onPressed,
      onChanged: onchanged,
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.thirdElementText),
        suffixIcon: clearWidget,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget inputTextAreaEdit({
  bool isPassword = false,
  bool autofocus = false,
  double marginTop = 15,
  String? hintText,
  ValueChanged<String>? onchanged,
  TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Container(
    height: 100.h,
    margin: EdgeInsets.only(top: marginTop.h),
    decoration: const BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRadius,
    ),
    child: TextField(
      maxLines: 3,
      autofocus: autofocus,
      onChanged: onchanged,
      controller: controller,
      autocorrect: false,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.thirdElementText),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget inputEmailEdit({
  bool autofocus = false,
  bool isPassword = false,
  double marginTop = 15,
  String? hintText,
  TextInputType keyboardType = TextInputType.text,
  TextEditingController? controller,
}) {
  return Container(
    height: 44.h,
    margin: EdgeInsets.only(top: marginTop.h),
    decoration: const BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: Radii.k6pxRadius,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      maxLines: 1,
      autofocus: autofocus,
      controller: controller,
      autocorrect: false,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.primaryText),
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 9),
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 18.sp,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
