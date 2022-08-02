// ignore_for_file: file_names

class Users {
  String kullaniciAd;
  String kullaniciPsw;
  String kullaniciId;
  String kullaniciType;

  Users(this.kullaniciAd, this.kullaniciPsw, this.kullaniciId,
      this.kullaniciType);

  factory Users.fromJson(String key, Map<dynamic, dynamic> json) {
    return Users(json["Kullanici Ad"], json["Kullanici Password"], key,
        json["Kullanici Type"]);
  }
}
