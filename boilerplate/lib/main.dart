import 'package:boilerplate/Notification/NotificationHOme.dart';
import 'package:boilerplate/Notification/NotificationService/NotificationService.dart';
import 'package:boilerplate/screenmode/screenMode.dart';
import 'package:boilerplate/screenmode/themprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          home: Screenmode(),
        );
      },
    );
  }
}
