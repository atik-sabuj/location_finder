class SubDistrictModel {
  SubDistrictModel({
      this.id, 
      this.districtId, 
      this.name, 
      this.bnName, 
      this.url,});

  SubDistrictModel.fromJson(dynamic json) {
    id = json['id'];
    districtId = json['district_id'];
    name = json['name'];
    bnName = json['bn_name'];
    url = json['url'];
  }
  String? id;
  String? districtId;
  String? name;
  String? bnName;
  String? url;
SubDistrictModel copyWith({  String? id,
  String? districtId,
  String? name,
  String? bnName,
  String? url,
}) => SubDistrictModel(  id: id ?? this.id,
  districtId: districtId ?? this.districtId,
  name: name ?? this.name,
  bnName: bnName ?? this.bnName,
  url: url ?? this.url,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['district_id'] = districtId;
    map['name'] = name;
    map['bn_name'] = bnName;
    map['url'] = url;
    return map;
  }

}