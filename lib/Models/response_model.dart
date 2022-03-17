import 'package:link_shorter/Models/short_link_model.dart';

class ResponseModel {
  bool? ok;
  int? errorCode;
  String? error;
  ShortLinkModel? result;

  ResponseModel({this.ok, this.errorCode, this.error, this.result});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    errorCode = json['error_code'];
    error = json['error'];
    result =
        json['result'] != null ? ShortLinkModel.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ok'] = ok;
    data['error_code'] = errorCode;
    data['error'] = error;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

