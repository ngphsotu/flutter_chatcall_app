import '/lib.dart';
import 'index.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('message page')),
    );
  }
}
