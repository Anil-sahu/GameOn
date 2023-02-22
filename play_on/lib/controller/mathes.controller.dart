import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Matches extends GetxController {
  var mathes = [].obs;
  var country = [].obs;
  @override
  void onInit() {
    fetchCountry();
    fetchMathes();
    super.onInit();
  }

  fetchCountry() async {
    try {
      String url =
          "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/index.json";
      var res = await http.get(Uri.parse(url));
      var decodCountry = await convert.jsonDecode(res.body);
      country.value = decodCountry;
      // something
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
    }
  }

  fetchMathes() async {
    String url =
        "https://rest.entitysport.com/v2/competitions/121143/matches/?token=ec471071441bb2ac538a0ff901abd249&per_page=50&&paged=1";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var decodData = await convert.jsonDecode(response.body);
        mathes.value = await decodData['response']['items'];
      } else {
        debugPrint(response.statusCode as String?);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
