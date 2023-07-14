import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class CoinService {
  final Uri _request =
      Uri.parse("https://api.hgbrasil.com/finance?key=SUA-CHAVE");

  Future<Coin> getAll() async {
    http.Response response = await http.get(_request);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Coin coin = Coin.fromJson(data);
      return coin;
    } else {
      throw Exception('Failed to fetch coin data');
    }
  }
}
