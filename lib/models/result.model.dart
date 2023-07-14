import 'package:cripto/models/bitcoin.model.dart';
import 'package:cripto/models/currency.model.dart';
import 'package:cripto/models/stock.model.dart';
import 'package:cripto/models/taxes.model.dart';

class Result {
  Currency? currencies;
  Stock? stocks;
  List<String>? availableSources;
  Bitcoin? bitcoin;
  List<Taxes>? taxes;

  Result(
      {this.currencies,
      this.stocks,
      this.availableSources,
      this.bitcoin,
      this.taxes});

  Result.fromJson(Map<String, dynamic> json) {
    currencies = json['currencies'] != null
        ? new Currency.fromJson(json['currencies'])
        : null;
    stocks = json['stocks'] != null ? new Stock.fromJson(json['stocks']) : null;
    availableSources = json['available_sources'].cast<String>();
    bitcoin =
        json['bitcoin'] != null ? new Bitcoin.fromJson(json['bitcoin']) : null;
    if (json['taxes'] != null) {
      taxes = <Taxes>[];
      json['taxes'].forEach((v) {
        taxes!.add(new Taxes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.toJson();
    }
    if (this.stocks != null) {
      data['stocks'] = this.stocks!.toJson();
    }
    data['available_sources'] = this.availableSources;
    if (this.bitcoin != null) {
      data['bitcoin'] = this.bitcoin!.toJson();
    }
    if (this.taxes != null) {
      data['taxes'] = this.taxes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
