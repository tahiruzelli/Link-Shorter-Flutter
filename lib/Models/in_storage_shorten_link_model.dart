class InStorageShortenLinkModel {
  String? longLink;
  String? shortenLink;
  InStorageShortenLinkModel({this.longLink, this.shortenLink});
  InStorageShortenLinkModel.fromJson(Map<String, dynamic> json) {
    longLink = json['longLink'];
    shortenLink = json['shortenLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['longLink'] = longLink;
    data['shortenLink'] = shortenLink;
    return data;
  }

  List<Map> toMap(List<InStorageShortenLinkModel> list) {
    List<Map> newList = [];
    list.forEach((element) {
      newList.add({
        "longLink" : element.longLink,
        "shortenLink" : element.shortenLink,
      });
    });
    return newList;
  }
}
