class CarouselImage {
  double? qryTime;
  int? total;
  int? dataSize;
  int? pageno;
  int? pageSize;
  String? error;
  List<DataImage>? data;

  CarouselImage(
      {this.qryTime,
      this.total,
      this.dataSize,
      this.pageno,
      this.pageSize,
      this.error,
      this.data});

  CarouselImage.fromJson(Map<String, dynamic> json) {
    qryTime = json['qryTime'];
    total = json['total'];
    dataSize = json['dataSize'];
    pageno = json['pageno'];
    pageSize = json['pageSize'];
    error = json['error'];
    if (json['data'] != null) {
      data = <DataImage>[];
      json['data'].forEach((v) {
        data!.add(new DataImage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qryTime'] = this.qryTime;
    data['total'] = this.total;
    data['dataSize'] = this.dataSize;
    data['pageno'] = this.pageno;
    data['pageSize'] = this.pageSize;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataImage {
  String? id;
  String? imageurl;
  String? descriptionjson;

  DataImage({this.id, this.imageurl, this.descriptionjson});

  DataImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageurl = json['imageurl'];
    descriptionjson = json['descriptionjson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageurl'] = this.imageurl;
    data['descriptionjson'] = this.descriptionjson;
    return data;
  }
}
