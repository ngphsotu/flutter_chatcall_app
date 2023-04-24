import '/lib.dart';
import '../values/values.dart';

Widget netImageCached(String url,
    {double width = 48, double height = 48, EdgeInsetsGeometry? margin}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      width: width.w,
      height: height.h,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: Radii.k54pxRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: imageProvider,
          // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        ),
      ),
    ),
    errorWidget: (context, url, error) => const Image(
      image: AssetImage('assets/images/feature-1.png'),
    ),
  );
}
