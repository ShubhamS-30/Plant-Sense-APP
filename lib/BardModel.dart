// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers, file_names

class bardModel {
  String? system;
  String? message;

  bardModel({this.system, this.message});

  bardModel.fromJson(Map<String, dynamic> json) {
    if (json["system"] is String) {
      system = json["system"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["system"] = system;
    _data["message"] = message;
    return _data;
  }
}
