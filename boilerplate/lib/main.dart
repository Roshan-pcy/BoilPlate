import 'package:boilerplate/Notification/NotificationHOme.dart';
import 'package:boilerplate/Notification/NotificationService/NotificationService.dart';
import 'package:boilerplate/chart/barcahrt.dart';
import 'package:boilerplate/chart/mychart.dart';
import 'package:boilerplate/chart/pieChart.dart';
import 'package:boilerplate/chart/pieChart2.dart';
import 'package:boilerplate/global/global.dart';
import 'package:boilerplate/screenmode/screenMode.dart';
import 'package:boilerplate/screenmode/themprovider.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  isNotificationEnabled = await Permission.notification.status.isGranted;

  print(isNotificationEnabled);
  NotificationClass().initailizeNotification();

//  NotificationService().initNotification();
  // tz.initializeTimeZones();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: themeProvider.getTheme, // Apply the current theme
          home: NotificationHome(),
        );
      },
    );
  }
}
