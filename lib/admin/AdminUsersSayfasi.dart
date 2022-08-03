// ignore_for_file: file_names, unnecessary_import

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:r6_guide_app_firebase/Users.dart';
import 'package:r6_guide_app_firebase/admin/AdminUsersDetaySayfasi.dart';

class AdminUsersSayfasi extends StatefulWidget {
  const AdminUsersSayfasi({Key? key}) : super(key: key);

  @override
  State<AdminUsersSayfasi> createState() => _AdminUsersSayfasiState();
}

class _AdminUsersSayfasiState extends State<AdminUsersSayfasi> {
  var refUsers = FirebaseDatabase.instance.ref().child("Users");

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
          title: const Text('Admin Users Sayfası'),
        ),
        body: StreamBuilder<DatabaseEvent>(
          stream: refUsers.onValue,
          builder: (context, event) {
            var usersListesi = <Users>[];

            var gelenDegerler = event.data?.snapshot.value as dynamic;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenUsers = Users.fromJson(key, nesne);

                usersListesi.add(gelenUsers);
                usersListesi
                    .sort((a, b) => a.kullaniciType.compareTo(b.kullaniciType));
              });
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: usersListesi.length,
                  itemBuilder: (context, index) {
                    var users = usersListesi[index];
                    return GestureDetector(
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 5,
                                    child: SizedBox(
                                      width: 100,
                                      height: 50,
                                      child: Center(
                                        child: Text(
                                          users.kullaniciAd,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )),
                                Flexible(
                                  flex: 8,
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Center(
                                      child: Text(
                                        users.kullaniciType,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 5,
                                  child: SizedBox(
                                    height: 50,
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AdminUsersDetaySayfasi(
                                                          users.kullaniciAd,
                                                          users.kullaniciId,
                                                          users.kullaniciPsw,
                                                          users
                                                              .kullaniciType)));
                                        },
                                        icon: const Icon(Icons.edit)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
