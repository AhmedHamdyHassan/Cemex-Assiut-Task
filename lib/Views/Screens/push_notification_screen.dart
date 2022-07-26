import 'package:cemex_task/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Widgets/custom_text_field.dart';

class PushNotificationScreen extends StatefulWidget {
  static const String pushNotificationScreenKey =
      '/PushNotificationScreenNavigation';
  const PushNotificationScreen({Key? key}) : super(key: key);

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  final TextEditingController _pushNotificationController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((event) {
      RemoteNotification? notification = event.notification;
      AndroidNotification? androidNotification = event.notification?.android;
      if (notification != null && androidNotification != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher',
              playSound: true,
              color: Colors.blue,
            ),
          ),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      RemoteNotification? notification = event.notification;
      AndroidNotification? androidNotification = event.notification?.android;
      if (notification != null && androidNotification != null) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Text(notification.body!),
                ),
              );
            });
      }
    });
  }

  void _pushNotification() async {
    flutterLocalNotificationsPlugin.show(
        0,
        'Flutter Notification',
        _pushNotificationController.text,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            importance: Importance.high,
            icon: '@mipmap/ic_launcher',
            playSound: true,
            color: Colors.blue,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Image.asset(
                'assets/images/cemex.png',
                fit: BoxFit.fill,
              ),
            ),
            CustomTextField(
              hint: 'Enter anything to push as Notification',
              obsecureInput: false,
              textEditingController: _pushNotificationController,
              obsecureCharacter: '*',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: _pushNotification,
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  fixedSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Push Notification',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
