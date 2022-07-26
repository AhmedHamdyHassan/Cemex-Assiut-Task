import 'package:flutter/material.dart';

import '../../Models/truck_model.dart';
import 'custom_data_row.dart';
import 'custom_rich_text.dart';

class CustomCard extends StatelessWidget {
  final TruckModel truckModel;
  const CustomCard({Key? key, required this.truckModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CustomDataRow(
                  child1: Text(
                    truckModel.truckName!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  child2: Text(
                    '#${truckModel.truckNumber!}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                CustomRichText(
                  text1: 'Company: ',
                  text2: truckModel.truckCompany!,
                ),
                CustomRichText(
                  text1: 'Type: ',
                  text2: truckModel.type!,
                ),
                CustomRichText(
                  text1: 'Vehichle Model No: ',
                  text2: truckModel.vehichleModelNo!,
                ),
                CustomRichText(
                  text1: 'Size: ',
                  text2: '${truckModel.size!} ${truckModel.unit}',
                ),
                CustomRichText(
                  text1: 'Engine: ',
                  text2: truckModel.engine,
                ),
                CustomRichText(
                  text1: 'Year: ',
                  text2: truckModel.truckYear.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
