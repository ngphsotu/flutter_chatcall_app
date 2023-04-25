import 'lib.dart';
import 'global.dart';
import '/common/common.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child) => GetMaterialApp(
        title: 'Chat Call',
        theme: ThemeData(primarySwatch: Colors.blue),
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
