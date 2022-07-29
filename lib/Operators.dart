// ignore_for_file: non_constant_identifier_names, file_names

class Operators {
  String operator_bio;
  String operator_birthPlace;
  String operator_dob;
  String operator_height;
  String operator_weight;
  String operator_icon;
  String operator_org;
  String operator_nickName;
  String operator_name;
  String operator_type;

  Operators(
      this.operator_bio,
      this.operator_birthPlace,
      this.operator_dob,
      this.operator_height,
      this.operator_weight,
      this.operator_icon,
      this.operator_org,
      this.operator_nickName,
      this.operator_name,
      this.operator_type);

  factory Operators.fromJson(Map<dynamic, dynamic> json) {
    return Operators(
        json["BIO"] as String,
        json["Birth Place"] as String,
        json["DOB"] as String,
        json["Height"] as String,
        json["Weight"] as String,
        json["Icon"] as String,
        json["ORG"] as String,
        json["NickName"] as String,
        json["Operator Name"] as String,
        json["Type"] as String);
  }
}
