// ignore_for_file: file_names

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:r6_guide_app_firebase/Weapons.dart';
import 'package:r6_guide_app_firebase/WeaponsDetail.dart';

class WeaponsScreen extends StatefulWidget {
  const WeaponsScreen({Key? key}) : super(key: key);

  @override
  State<WeaponsScreen> createState() => _WeaponsScreenState();
}

class _WeaponsScreenState extends State<WeaponsScreen> {
  var refWeapons = FirebaseDatabase.instance.ref().child("Weapons");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Weapons Page'),
        ),
        body: StreamBuilder<DatabaseEvent>(
          stream: refWeapons.onValue,
          builder: (context, event) {
            var weaponsListesi = <Weapons>[];

            var gelenDegerler = event.data?.snapshot.value as dynamic;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenWeapons = Weapons.fromJson(nesne);

                weaponsListesi.add(gelenWeapons);
                weaponsListesi.sort(
                  (a, b) => a.type.compareTo(b.type),
                );
              });
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: weaponsListesi.length,
                  itemBuilder: (context, index) {
                    var weapons = weaponsListesi[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  WeaponDetailScreen(weapons.damage,weapons.magazine,weapons.operators,weapons.rof,weapons.suppressedDamage,weapons.type,weapons.weaponName)),
                      ),
                      child: Card(
                        elevation: 20,
                        shadowColor: Colors.red,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FittedBox(
                                  child: Text(weapons.weaponName),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: 100,
                                  child: Image.network(weapons.weaponIcon),
                                ),
                                const SizedBox(height: 10),
                                FittedBox(
                                  child: Text(weapons.type),
                                )
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
