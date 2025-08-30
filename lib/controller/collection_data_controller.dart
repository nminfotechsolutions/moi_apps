import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/places_response.dart';

class CollectionDataController extends GetxController {
  var allCityData = <CityAndNameData>[].obs;
  var filteredList = <CityAndNameData>[].obs;

  var searchText = ''.obs;

  void onInt() {
    super.onInit();
    fetchAllCityAndName();
  }

  Future<String?> fetchAllCityAndName() async {
    try {
      final url = Uri.parse(
        'https://nminfotech.in/dataloadapi.aspx?action=D&cloudid=002SM',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        final billResponse = PlacesResponse.fromJson(jsonResponse);

        allCityData.value = billResponse.data;
        filteredList.value = billResponse.data;
        print(allCityData);
        print(response.body);
      } else {
        response.body;
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  Future<String> thanglishToTamil(String text) async {
    if (text.isEmpty) return text;

    final url = Uri.parse(
      'https://inputtools.google.com/request?text=$text&itc=ta-t-i0-und&num=1',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result[0] == "SUCCESS" && result[1].isNotEmpty) {
        return result[1][0][1][0];
      }
    }
    return text;
  }

  // ✅ Make sure this exists inside the controller
  Future<List<CityAndNameData>> filterData(
    List<CityAndNameData> data,
    String searchText,
  ) async {
    final searchTamil = await thanglishToTamil(searchText);

    return data.where((item) {
      final nameLower = item.memName.toLowerCase();
      final cityLower = item.cityName.toLowerCase();
      return nameLower.contains(searchTamil.toLowerCase()) ||
          cityLower.contains(searchTamil.toLowerCase());
    }).toList();
  }
}
