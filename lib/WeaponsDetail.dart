// ignore_for_file: file_names

import 'package:flutter/material.dart';

class WeaponDetailScreen extends StatefulWidget {
  const WeaponDetailScreen({Key? key}) : super(key: key);

  @override
  State<WeaponDetailScreen> createState() => _WeaponDetailScreenState();
}

class _WeaponDetailScreenState extends State<WeaponDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Weapons Detail Page'),
      ),
    );
  }
}
