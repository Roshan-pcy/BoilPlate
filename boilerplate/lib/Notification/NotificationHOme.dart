import 'package:boilerplate/Notification/NotificationService/NotificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationHome extends StatefulWidget {
  NotificationHome({super.key});

  @override
  State<NotificationHome> createState() => _NotificationHomeState();
}

class _NotificationHomeState extends State<NotificationHome> {
  TimeOfDay timeOfDay = TimeOfDay(hour: 7, minute: 30);
  @override
  void initState() {
    super.initState();
    _loadSavedTime(); // Load saved time when the widget is initialized
  }

  Future<void> _loadSavedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTime = prefs.getString('selectedTime');
    if (savedTime != null) {
      List<String> timeParts = savedTime.split(':');
      setState(() {
        timeOfDay = TimeOfDay(
          hour: int.parse(timeParts[0]),
          minute: int.parse(timeParts[1]),
        );
      });
    }
  }

  // Save the selected time in SharedPreferences
  Future<void> _saveTime(TimeOfDay selectedTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String timeString = '${selectedTime.hour}:${selectedTime.minute}';
    await prefs.setString('selectedTime', timeString);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(child: Text('ended')),
            ElevatedButton(
                onPressed: () {
                  NotificationClass().secheduNotification('hello', 'hello', 3);
                  // NotificationClass().secheduNotification('hello', 'hello', 30);
                  // NotificationClass().secheduNotification('hello', 'hello', 60);
                  // NotificationClass()
                  //     .secheduNotification('hello', 'hello', 120);
                  // NotificationClass()
                  //     .secheduNotification('hello', 'hello', 3000);
                  // NotificationClass()
                  //     .secheduNotification('hello', 'hello', 1000);
                  print('helloc clicked');
                },
                child: Text('check notification')),
            ElevatedButton(
                onPressed: () {
                  NotificationClass()
                      .scheduleTestNotificationForTomorrow('hello', 'hello');

                  print('set');
                },
                child: Text('send notification')),
            SizedBox(
              height: 30,
            ),
            Text(timeOfDay.format(context).toString()),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: timeOfDay,
                ).then((value) {
                  if (value != null) {
                    setState(() {
                      timeOfDay = value; // Update the timeOfDay variable
                      NotificationClass()
                          .scheduleTestNotificationForSelectedTime(
                              'the day', 'check your routine', timeOfDay);
                      print('CLikced');
                    });
                    _saveTime(value); // Save the selected time
                  }
                });
              },
              child: Text('Select Time'),
            ),
          ],
        ),
      ),
    );
  }
}
