import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: Image.asset(
              'assets/images/cemex.png',
              fit: BoxFit.fill,
            ),
          ),
          const CircularProgressIndicator(),
        ],
      )),
    );
  }
}
