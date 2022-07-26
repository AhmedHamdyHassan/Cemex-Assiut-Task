import 'package:cemex_task/main.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  const ErrorScreen({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Stack(
        children: [
          Center(
            child: Card(
              elevation: 5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                width: MediaQuery.of(context).size.width / 1.2 - 50,
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / (4 * 4) + 10,
                    ),
                    const Text(
                      'Failed',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(errorMessage),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const MyApp(),
                                  ),
                                );
                              },
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              child: const Text(
                                'Retry',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        const MyApp(),
                                  ),
                                );
                              },
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              child: const Text(
                                'Ok',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 4,
            top: 1,
            left: 1,
            right: 1,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: const [
                    Center(
                      child: Icon(
                        Icons.shield,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    Center(
                      child: Icon(
                        UniconsLine.info,
                        color: Colors.red,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
