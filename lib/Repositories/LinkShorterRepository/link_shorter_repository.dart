import 'package:link_shorter/Globals/Constans/urls.dart';
import 'package:link_shorter/Models/response_model.dart';
import 'package:link_shorter/Services/rest_connector.dart';

abstract class ILinkShorterRepository {
  Future<ResponseModel> getShortLink(String longLink);
}

class LinkShorterRepository extends ILinkShorterRepository {
  @override
  Future<ResponseModel> getShortLink(String longLink) async {
    var response = await RestConnector(
      linkShorterUrl + longLink,
    ).getData();
    return ResponseModel.fromJson(response);
  }
}
