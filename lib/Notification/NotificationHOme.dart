 import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _isNotificationEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkNotificationPermission();
  }

  Future<void> _checkNotificationPermission() async {
    // Check if notifications are enabled
    bool isGranted = await Permission.notification.isGranted;
    setState(() {
      _isNotificationEnabled = isGranted;
    });
  }

  void _openSettings() async {
    // Open app settings
    await openAppSettings();
    // Recheck the notification status after returning from settings
    _checkNotificationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: Center(
        child: _isNotificationEnabled
            ? Text(
                'Notifications Enabled',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
              )
            : GestureDetector(
                onTap: _openSettings,
                child: Text(
                  'Enable Notifications',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
      ),
    );
  }
}
