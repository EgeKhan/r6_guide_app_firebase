// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AdminUsersSayfasi extends StatefulWidget {
  const AdminUsersSayfasi({Key? key}) : super(key: key);

  @override
  State<AdminUsersSayfasi> createState() => _AdminUsersSayfasiState();
}

class _AdminUsersSayfasiState extends State<AdminUsersSayfasi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: const Text('Güncelleme Sayfası'),
        ),
      ),
    );
  }
}
