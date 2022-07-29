// ignore_for_file: file_names

class Weapons {
  String damage;
  String suppressedDamage;
  String magazine;
  String operators;
  String rof;
  String type;
  String weaponIcon;
  String weaponName;

  Weapons(this.damage, this.suppressedDamage, this.magazine, this.operators,
      this.rof, this.type, this.weaponIcon, this.weaponName);

  factory Weapons.fromJson(Map<dynamic, dynamic> json) {
    return Weapons(
        json["Damage"],
        json["Suppressed Damage"],
        json["Magazine"],
        json["Operator"],
        json["ROF"],
        json["Type"],
        json["Weapon Icon"],
        json["Weapon Name"]);
  }
}
