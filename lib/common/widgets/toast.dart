import '/lib.dart';

Future<bool?> toastInfo({
  required String msg,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.TOP,
    fontSize: 16.sp,
    textColor: textColor,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: backgroundColor,
    timeInSecForIosWeb: 2,
  );
}
