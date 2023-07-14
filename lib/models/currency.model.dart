import 'package:cripto/models/gbp.model.dart';
import 'package:cripto/models/usd.model.dart';

class Currency {
  String? source;
  USD? uSD;
  USD? eUR;
  GBP? gBP;
  GBP? aRS;
  GBP? cAD;
  GBP? aUD;
  GBP? jPY;
  GBP? cNY;
  USD? bTC;

  Currency(
      {this.source,
      this.uSD,
      this.eUR,
      this.gBP,
      this.aRS,
      this.cAD,
      this.aUD,
      this.jPY,
      this.cNY,
      this.bTC});

  Currency.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    uSD = json['USD'] != null ? new USD.fromJson(json['USD']) : null;
    eUR = json['EUR'] != null ? new USD.fromJson(json['EUR']) : null;
    gBP = json['GBP'] != null ? new GBP.fromJson(json['GBP']) : null;
    aRS = json['ARS'] != null ? new GBP.fromJson(json['ARS']) : null;
    cAD = json['CAD'] != null ? new GBP.fromJson(json['CAD']) : null;
    aUD = json['AUD'] != null ? new GBP.fromJson(json['AUD']) : null;
    jPY = json['JPY'] != null ? new GBP.fromJson(json['JPY']) : null;
    cNY = json['CNY'] != null ? new GBP.fromJson(json['CNY']) : null;
    bTC = json['BTC'] != null ? new USD.fromJson(json['BTC']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source;
    if (this.uSD != null) {
      data['USD'] = this.uSD!.toJson();
    }
    if (this.eUR != null) {
      data['EUR'] = this.eUR!.toJson();
    }
    if (this.gBP != null) {
      data['GBP'] = this.gBP!.toJson();
    }
    if (this.aRS != null) {
      data['ARS'] = this.aRS!.toJson();
    }
    if (this.cAD != null) {
      data['CAD'] = this.cAD!.toJson();
    }
    if (this.aUD != null) {
      data['AUD'] = this.aUD!.toJson();
    }
    if (this.jPY != null) {
      data['JPY'] = this.jPY!.toJson();
    }
    if (this.cNY != null) {
      data['CNY'] = this.cNY!.toJson();
    }
    if (this.bTC != null) {
      data['BTC'] = this.bTC!.toJson();
    }
    return data;
  }
}
