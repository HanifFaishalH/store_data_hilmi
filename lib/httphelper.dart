import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:store_data_hilmi/model/pizza.dart';
import 'dart:convert';

class HttpHelper {
  final String authority = 'pizza-api.wiremockapi.cloud';
  final String path = 'pizzalist';
  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);

      List<Pizza> pizzas =
          jsonResponse.map<Pizza>((i) =>
            Pizza.fromJson(i)).toList();
      return pizzas;
    } else {
      return [];
    }
  }
}