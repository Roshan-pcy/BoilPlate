import 'package:boilerplate/Notification/NotificationService/NotificationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class NotificationHome extends StatelessWidget {
  const NotificationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(child: Text('ended')),
            ElevatedButton(
                onPressed: () {
                  NotificationClass().secheduNotification('hello', 'hello');
                  print('helloc clicked');
                },
                child: Text('hello'))
          ],
        ),
      ),
    );
  }
}
