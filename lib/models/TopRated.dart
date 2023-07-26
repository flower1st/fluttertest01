class TopRated {
  double? qryTime;
  int? total;
  int? dataSize;
  int? pageno;
  int? pageSize;
  String? error;
  List<Data>? data;

  TopRated(
      {this.qryTime,
      this.total,
      this.dataSize,
      this.pageno,
      this.pageSize,
      this.error,
      this.data});

  TopRated.fromJson(Map<String, dynamic> json) {
    qryTime = json['qryTime'];
    total = json['total'];
    dataSize = json['dataSize'];
    pageno = json['pageno'];
    pageSize = json['pageSize'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? salonid;
  String? name;
  String? description;
  String? star;
  String? imageurl;
  int? reviewnumber;
  String? salonavatar;

  Data(
      {this.salonid,
      this.name,
      this.description,
      this.star,
      this.imageurl,
      this.reviewnumber,
      this.salonavatar});

  Data.fromJson(Map<String, dynamic> json) {
    salonid = json['salonid'];
    name = json['name'];
    description = json['description'];
    star = json['star'];
    imageurl = json['imageurl'];
    reviewnumber = json['reviewnumber'];
    salonavatar = json['salonavatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salonid'] = this.salonid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['star'] = this.star;
    data['imageurl'] = this.imageurl;
    data['reviewnumber'] = this.reviewnumber;
    data['salonavatar'] = this.salonavatar;
    return data;
  }
}
