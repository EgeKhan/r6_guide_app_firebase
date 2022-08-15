// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class WeaponDetailScreen extends StatefulWidget {
  String mapName;
  String mapImg1;
  String mapImg2;
  String mapImg3;
  String suppressedDamage;
  String weaponType;
  String weaponName;

  WeaponDetailScreen(this.mapName, this.mapImg1, this.mapImg2, this.mapImg3,
      this.suppressedDamage, this.weaponType, this.weaponName,
      {Key? key})
      : super(key: key);

  @override
  State<WeaponDetailScreen> createState() => _WeaponDetailScreenState();
}

class _WeaponDetailScreenState extends State<WeaponDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Maps Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 10,
          child: Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Map Name: ${widget.mapName}'),
                  Text('Map Image: ${widget.mapImg1}'),
                  Text('Map Image: ${widget.mapImg2}'),
                  Text('Map Image: ${widget.mapImg3}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
