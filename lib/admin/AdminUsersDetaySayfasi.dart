// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, must_be_immutable

import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:r6_guide_app_firebase/admin/AdminPage.dart';

class AdminUsersDetaySayfasi extends StatefulWidget {
  String userAd;
  String userId;
  String userPsw;
  String userType;
  AdminUsersDetaySayfasi(this.userAd, this.userId, this.userPsw, this.userType,
      {Key? key})
      : super(key: key);

  @override
  State<AdminUsersDetaySayfasi> createState() => _AdminUsersDetaySayfasiState();
}

class _AdminUsersDetaySayfasiState extends State<AdminUsersDetaySayfasi> {
  var tfUserAd = TextEditingController();
  var tfUserId = TextEditingController();
  var tfUserPsw = TextEditingController();
  var tfUserType = TextEditingController();
  var controller = true;
  var refUsers = FirebaseDatabase.instance.ref().child("Users");

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    tfUserAd.text = widget.userAd;
    tfUserId.text = widget.userId;
    tfUserPsw.text = widget.userPsw;
    tfUserType.text = widget.userType;
  }

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
          title: const Text('Admin Users Detay'),
          actions: [
            TextButton(
                onPressed: () {
                  var guncelBilgi = HashMap<String, dynamic>();
                  guncelBilgi["Kullanici Ad"] = tfUserAd.text;
                  guncelBilgi["Kullanici Password"] = tfUserPsw.text;
                  guncelBilgi["Kullanici Type"] = tfUserType.text;

                  refUsers.child(widget.userId).update(guncelBilgi);
                },
                child: const Text(
                  'GÜNCELLE',
                  style: TextStyle(color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  refUsers.child(widget.userId).remove();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminPageScreen()),
                      (route) => false);
                },
                child: const Text(
                  'SİL',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfUserAd,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı Adı:'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: controller,
                  controller: tfUserPsw,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Kullanıcı Psw:',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (controller == true) {
                              controller = false;
                            } else {
                              controller = true;
                            }
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfUserType,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı Type:'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
