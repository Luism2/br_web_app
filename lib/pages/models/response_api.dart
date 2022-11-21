import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String? message;
  String? error;
  bool? success;
  dynamic data;

  ResponseApi({
    this.message,
    this.error,
    this.success,
  });

  ResponseApi.fromJson(Map<String, dynamic> json) {
    message = json["mesage"];
    error = json["error"];
    success = json["aprovado"];

    try {
      data = json['data'];
    } catch (e) {
      print('dato erroneo $e');
    }
  }

  Map<String, dynamic> toJson() => {
        "mesage": message,
        "error": error,
        "aprovado": success,
        "dato": data,
      };
}
