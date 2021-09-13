class CovidModel {
  
  String ?tinh;
  String ?nhiem;
  String ?tuvong;
  String ?tongNhiem;
  String ?tongTuvong;

  CovidModel({this.tinh, this.nhiem, this.tuvong, this.tongNhiem, this.tongTuvong});

  CovidModel.fromJson(Map<String, dynamic> json) {
    tinh = json['tinh'];
    nhiem = json['nhiem'];
    tuvong = json['tuvong'];
    tongNhiem = json['tong_nhiem'];
    tongTuvong = json['tong_tuvong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tinh'] = this.tinh;
    data['nhiem'] = this.nhiem;
    data['tuvong'] = this.tuvong;
    data['tong_nhiem'] = this.tongNhiem;
    data['tong_tuvong'] = this.tongTuvong;
    return data;
  }
}
