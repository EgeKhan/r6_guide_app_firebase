// ignore_for_file: file_names

class Users {
  String kullaniciAd;
  String kullaniciPsw;
  String kullaniciId = "";

  Users(this.kullaniciAd, this.kullaniciPsw, this.kullaniciId);

  factory Users.fromJson(Map<dynamic, dynamic> json) {
    return Users(
        json["Kullanici Ad"], json["Kullanici Password"], json["Kullanici Id"]);
  }
}
