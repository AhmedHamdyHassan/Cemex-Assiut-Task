import 'package:cemex_task/Models/truck_model.dart';
import 'package:cemex_task/Models/user_model.dart';
import 'package:cemex_task/Views/Screens/app_drawer.dart';
import 'package:flutter/material.dart';

import '../Widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  final List<TruckModel> trucks;
  final UserModel user;
  const HomeScreen({Key? key, required this.trucks, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cemex Assiut',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      drawer: AppDrawer(
        userModel: user,
      ),
      body: SafeArea(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset(
              'assets/images/cemex.png',
              fit: BoxFit.fill,
            ),
          ),
          const Text(
            'Trucks Data',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomCard(
                  truckModel: trucks[index],
                );
              },
              itemCount: trucks.length,
            ),
          )
        ]),
      ),
    );
  }
}
