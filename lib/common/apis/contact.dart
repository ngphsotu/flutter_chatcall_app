import '../common.dart';

class ContactAPI {
  // Refresh
  static Future<ContactResponseEntity> postContact() async {
    var response = await HttpUtil().post('api/contact');
    return ContactResponseEntity.fromJson(response);
  }
}
