// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  var tfKullaniciAd = TextEditingController();
  var tfKullaniciPsw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.red,
          title: const Text('SingUp Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(
            children: [
              TextField(
                controller: tfKullaniciAd,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Kullanıcı Adı:'),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: tfKullaniciPsw,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kullanıcı Şifre:'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Kayıt Ol'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
