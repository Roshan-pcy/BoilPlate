import 'package:flutter/material.dart';
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
            priority: Priority.max, importance: Importance.max);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _notificationsPlugin.show(3, title, body, notificationDetails);
  }

  void secheduNotification(String title, String body, int duration) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelIdd', 'channelNamed',
            priority: Priority.low, importance: Importance.low);
    var iosDetailes = const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosDetailes);

    await _notificationsPlugin.zonedSchedule(
        1,
        title,
        body,
        Tz.TZDateTime.now(Tz.local).add(Duration(seconds: duration)),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  void stop_Notification() async {
    _notificationsPlugin.cancel(1);
  }

  void scheduleTestNotificationForTomorrow(String title, String body) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('daily_channelId', 'daily_channelName',
            priority: Priority.max, importance: Importance.max);
    var iosDetailes = const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosDetailes);

    // Get current time
    final now = Tz.TZDateTime.now(Tz.local);

    // Schedule the notification for tomorrow at the same time + 2 minutes
    Tz.TZDateTime scheduledTime = Tz.TZDateTime.local(
      now.year,
      now.month,
      now.day + 1, // Schedule for tomorrow
      now.hour,
      now.minute, // Add 2 minutes for testing purposes
      now.second,
    );

    await _notificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduledTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents:
          DateTimeComponents.time, // Repeats daily at the same time
    );
  }

// Function to convert TimeOfDay to TZDateTime
  Tz.TZDateTime _convertTimeOfDayToTZDateTime(TimeOfDay timeOfDay) {
    final now = Tz.TZDateTime.now(Tz.local);

    // Schedule for the same day or next day, depending on the selected time
    Tz.TZDateTime scheduledTime = Tz.TZDateTime.local(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    // If the selected time is earlier than the current time, schedule it for tomorrow
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    return scheduledTime;
  }

  void scheduleTestNotificationForSelectedTime(
      String title, String body, TimeOfDay selectedTime) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('daily_channelId', 'daily_channelName',
            priority: Priority.min, importance: Importance.min);
    var iosDetails = const DarwinNotificationDetails();
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iosDetails);

    // Use the selected time
    final scheduledTime = _convertTimeOfDayToTZDateTime(selectedTime);

    await _notificationsPlugin.zonedSchedule(
        0, title, body, scheduledTime, notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time);
  }
}
