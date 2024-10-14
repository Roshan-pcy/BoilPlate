import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as Tz;
import 'package:timezone/data/latest_all.dart' as Tz;

class NotificationClass {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  void initailizeNotification() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: DarwinInitializationSettings());
    Tz.initializeTimeZones();
    await _notificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            priority: Priority.high, importance: Importance.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _notificationsPlugin.show(0, title, body, notificationDetails);
  }

  void secheduNotification(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelIdd', 'channelNamed',
            priority: Priority.high, importance: Importance.max);
    var iosDetailes = const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosDetailes);

    await _notificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        Tz.TZDateTime.now(Tz.local).add(Duration(seconds: 10)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  void stop_Notification() async {
    _notificationsPlugin.cancel(1);
  }
}
