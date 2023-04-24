// ignore_for_file: unnecessary_overrides

import '/lib.dart';
import '../values/values.dart';
import '../services/services.dart';

class ConfigStore extends GetxController {
  bool isFirstOpen = false;
  bool isCallVocie = false;
  bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  String get version => _platform?.version ?? '-';
  Locale locale = const Locale('en', 'US');
  List<Locale> languages = [const Locale('en', 'US'), const Locale('zh', 'CN')];
  PackageInfo? _platform;
  static ConfigStore get to => Get.find();

  @override
  void onInit() {
    super.onInit();

    ///  isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
  }

  // * On Init Locale
  void onInitLocale() {
    var langCode = StorageService.to.getString(STORAGE_LANGUAGE_CODE);
    if (langCode.isEmpty) return;
    var index = languages.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = languages[index];
  }

  // * On Locale Update
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    StorageService.to.setString(STORAGE_LANGUAGE_CODE, value.languageCode);
  }
}
