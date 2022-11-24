import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;
import 'package:location_finder/models/district_model.dart';
import 'package:location_finder/models/sub_district_model.dart';

class LocationProvider extends ChangeNotifier {
  List<DistrictModel> districts = [];
  List<SubDistrictModel> subDistricts = [];

  String divValue = "Barisal";
  List<String> divList = [
    "Barisal",
    "Rajshahi",
    'Chittagong',
    "Dhaka",
    "Khulna",
    "Mymensingh",
    "Rajshahi",
    "Rangpur",
    "Sylhet",
  ];

  List<DistrictModel> districtList = [];
  DistrictModel? districtValue;

  List<SubDistrictModel> subDistrictList = [];
  SubDistrictModel? subDistrictValue;

  void findDistrictWithDivision(String value) {
    districtList = [];
    for (DistrictModel districtModel in districts) {
      if (districtModel.divisionId == value) {
        districtList.add(districtModel);
        print("Match");
      }
      print("value ${districts.length}");
    }
  }

  Future<void> getDistrictData() async {
    const urlString = 'https://pencilbox.edu.bd/districts';
    final response = await Http.get(Uri.parse(urlString));
    final map = json.decode(response.body);
    if (response.statusCode == 200) {
      for (Map i in map) {
        districts.add(DistrictModel.fromJson(i));
      }
      notifyListeners();
    } else {
      print(map['message']);
    }
  }

  Future<void> getSubDistrictData() async {
    const urlString = 'https://pencilbox.edu.bd/sub-districts';
    final response = await Http.get(Uri.parse(urlString));

    final map = json.decode(response.body);
    if (response.statusCode == 200) {
      for (Map i in map) {
        subDistricts.add(SubDistrictModel.fromJson(i));
      }
      notifyListeners();
    } else {
      print(map['message']);
    }
  }

  void findSubDistrictWithDistrict(DistrictModel value) {
    subDistrictList = [];
    for (SubDistrictModel subDis in subDistricts) {
      if (subDis.districtId == value.id) {
        subDistrictList.add(subDis);
        print("Match");
      }
    }
  }
}
