import '/lib.dart';

class Logger {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    Future.microtask(() {
      if (kDebugMode) {
        print('** $text. isError: [$isError]');
      }
    });
  }
}
