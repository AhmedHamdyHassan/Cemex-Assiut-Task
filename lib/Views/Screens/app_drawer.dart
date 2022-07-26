import 'package:cemex_task/Models/user_model.dart';
import 'package:cemex_task/Views/Screens/push_notification_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final UserModel userModel;
  const AppDrawer({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/Person.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              userModel.userName!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              userModel.email!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, PushNotificationScreen.pushNotificationScreenKey);
              },
              child: const Card(
                elevation: 2,
                margin: EdgeInsets.zero,
                child: ListTile(
                  leading: Icon(Icons.notification_add),
                  title: Text('Push Notification'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
