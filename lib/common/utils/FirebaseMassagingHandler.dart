// ignore_for_file: file_names, avoid_print, unused_local_variable

import '/lib.dart';
import '../apis/apis.dart';
import '../store/store.dart';
import '../routes/routes.dart';
import '../values/values.dart';
import '../entities/entities.dart';

class FirebaseMassagingHandler {
  FirebaseMassagingHandler._();
  static AndroidNotificationChannel channelCall =
      const AndroidNotificationChannel(
    'com.dbestech.chatty.call', // id
    'chatty_call', // title
    importance: Importance.max,
    enableLights: true,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('alert'),
  );
  static AndroidNotificationChannel channelMessage =
      const AndroidNotificationChannel(
    'com.dbestech.chatty.message', // id
    'chatty_message', // title
    importance: Importance.defaultImportance,
    enableLights: true,
    playSound: true,
    // sound: RawResourceAndroidNotificationSound('alert'),
  );

  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> config() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    try {
      RemoteMessage newMessage = const RemoteMessage();
      await messaging.requestPermission(
        sound: true,
        badge: true,
        alert: true,
        announcement: false,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
      );

      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        print('initialMessage------');
        print(initialMessage);
      }
      var initializationSettingsAndroid =
          const AndroidInitializationSettings('ic_launcher');
      var darwinInitializationSettings = const DarwinInitializationSettings();
      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: darwinInitializationSettings);
      flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: (value) {
        print('----------onDidReceiveNotificationResponse');
      });

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
              alert: true, badge: true, sound: true);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print('\n notification on onMessage function \n');
        print(message);
        _receiveNotification(message);
      });
    } on Exception catch (e) {
      print('$e');
    }
  }

  static Future<void> _receiveNotification(RemoteMessage message) async {
    if (message.data['call_type'] != null) {
      //  ////1. voice 2. video 3. text, 4.cancel
      if (message.data['call_type'] == 'voice') {
        //  FirebaseMassagingHandler.flutterLocalNotificationsPlugin.cancelAll();
        var data = message.data;
        var toToken = data['token'];
        var toName = data['name'];
        var toAvatar = data['avatar'];
        var docId = data['doc_id'] ?? '';
        // var call_role= data['call_type'];
        if (toToken != null && toName != null && toAvatar != null) {
          Get.snackbar(
              icon: Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(0.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(toAvatar)),
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                ),
              ),
              '$toName',
              'Voice call',
              duration: const Duration(seconds: 30),
              isDismissible: false,
              mainButton: TextButton(
                  onPressed: () {},
                  child: SizedBox(
                      width: 90.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (Get.isSnackbarOpen) {
                                Get.closeAllSnackbars();
                              }
                              FirebaseMassagingHandler._sendNotifications(
                                  'cancel', toToken, toAvatar, toName, docId);
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.primaryElementBg,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.w)),
                              ),
                              child: Image.asset('assets/icons/a_phone.png'),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                if (Get.isSnackbarOpen) {
                                  Get.closeAllSnackbars();
                                }
                                Get.toNamed(AppRoutes.VOICE_CALL, parameters: {
                                  'to_token': toToken,
                                  'to_name': toName,
                                  'to_avatar': toAvatar,
                                  'doc_id': docId,
                                  'call_role': 'audience'
                                });
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElementStatus,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.w)),
                                ),
                                child:
                                    Image.asset('assets/icons/a_telephone.png'),
                              ))
                        ],
                      ))));
        }
      } else if (message.data['call_type'] == 'video') {
        //    FirebaseMassagingHandler.flutterLocalNotificationsPlugin.cancelAll();
        //  ////1. voice 2. video 3. text, 4.cancel
        var data = message.data;
        var toToken = data['token'];
        var toName = data['name'];
        var toAvatar = data['avatar'];
        var docId = data['doc_id'] ?? '';
        // var call_role= data['call_type'];
        if (toToken != null && toName != null && toAvatar != null) {
          ConfigStore.to.isCallVocie = true;
          Get.snackbar(
              icon: Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(0.w),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(toAvatar)),
                  borderRadius: BorderRadius.all(Radius.circular(20.w)),
                ),
              ),
              '$toName',
              'Video call',
              duration: const Duration(seconds: 30),
              isDismissible: false,
              mainButton: TextButton(
                  onPressed: () {},
                  child: SizedBox(
                      width: 90.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (Get.isSnackbarOpen) {
                                Get.closeAllSnackbars();
                              }
                              FirebaseMassagingHandler._sendNotifications(
                                  'cancel', toToken, toAvatar, toName, docId);
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.w,
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColors.primaryElementBg,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.w)),
                              ),
                              child: Image.asset('assets/icons/a_phone.png'),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                if (Get.isSnackbarOpen) {
                                  Get.closeAllSnackbars();
                                }
                                Get.toNamed(AppRoutes.VIDEO_CALL, parameters: {
                                  'to_token': toToken,
                                  'to_name': toName,
                                  'to_avatar': toAvatar,
                                  'doc_id': docId,
                                  'call_role': 'audience'
                                });
                              },
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElementStatus,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.w)),
                                ),
                                child:
                                    Image.asset('assets/icons/a_telephone.png'),
                              ))
                        ],
                      ))));
        }
      } else if (message.data['call_type'] == 'cancel') {
        FirebaseMassagingHandler.flutterLocalNotificationsPlugin.cancelAll();

        if (Get.isSnackbarOpen) {
          Get.closeAllSnackbars();
        }

        if (Get.currentRoute.contains(AppRoutes.VOICE_CALL) ||
            Get.currentRoute.contains(AppRoutes.VIDEO_CALL)) {
          Get.back();
        }

        var prefs = await SharedPreferences.getInstance();
        await prefs.setString('CallVocieOrVideo', '');
      }
    }
  }

  static Future<void> _sendNotifications(String callType, String toToken,
      String toAvatar, String toName, String docId) async {
    CallRequestEntity callRequestEntity = CallRequestEntity();
    callRequestEntity.callType = callType;
    callRequestEntity.toToken = toToken;
    callRequestEntity.toAvatar = toAvatar;
    callRequestEntity.docId = docId;
    callRequestEntity.toName = toName;
    var res = await ChatAPI.callNotifications(params: callRequestEntity);
    print('sendNotifications');
    print(res);
    if (res.code == 0) {
      print('sendNotifications success');
    } else {
      // Get.snackbar('Tips', 'Notification error!');
      // Get.offAllNamed(AppRoutes.Message);
    }
  }

  static Future<void> showNotification({RemoteMessage? message}) async {
    RemoteNotification? notification = message!.notification;
    AndroidNotification? androidNotification = message.notification!.android;
    AppleNotification? appleNotification = message.notification!.apple;

    if (notification != null &&
        (androidNotification != null || appleNotification != null)) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channelCall.id,
            channelMessage.name,
            // channelBuffers.,
            icon: '@mipmap/ic_launcher',
            playSound: true,
            enableVibration: true,
            priority: Priority.defaultPriority,
            // channelShowBadge: true,
            importance: Importance.defaultImportance,
            // sound: RawResourceAndroidNotificationSound('alert'),
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );
    }
    // PlascoRequests().initReport();
  }
/*
  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackground(RemoteMessage message) async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
    print('message data: ${message.data}');
    print('message data: ${message}');
    print('message data: ${message.notification}');

    if(message!=null){
      if(message.data!=null && message.data['call_type']!=null) {

        if(message.data['call_type']=='cancel'){
            FirebaseMassagingHandler.flutterLocalNotificationsPlugin.cancelAll();
          //  await setCallVocieOrVideo(false);
            var _prefs = await SharedPreferences.getInstance();
            await _prefs.setString('CallVocieOrVideo', '');
        }
        if(message.data['call_type']=='voice' || message.data['call_type']=='video'){

          var data = {
            'to_token':message.data['token'],
            'to_name':message.data['name'],
            'to_avatar':message.data['avatar'],
            'doc_id':message.data['doc_id']??'',
            'call_type':message.data['call_type'],
            'expire_time':DateTime.now().toString(),
          };
          print(data);
          var _prefs = await SharedPreferences.getInstance();
          await _prefs.setString('CallVocieOrVideo', jsonEncode(data));
        }
      }
    }
  }*/
}