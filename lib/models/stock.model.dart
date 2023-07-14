import 'package:cripto/models/ibovespa.model.dart';

class Stock {
  IBOVESPA? iBOVESPA;
  IBOVESPA? iFIX;
  IBOVESPA? nASDAQ;
  IBOVESPA? dOWJONES;
  IBOVESPA? cAC;
  IBOVESPA? nIKKEI;

  Stock(
      {this.iBOVESPA,
      this.iFIX,
      this.nASDAQ,
      this.dOWJONES,
      this.cAC,
      this.nIKKEI});

  Stock.fromJson(Map<String, dynamic> json) {
    iBOVESPA = json['IBOVESPA'] != null
        ? new IBOVESPA.fromJson(json['IBOVESPA'])
        : null;
    iFIX = json['IFIX'] != null ? new IBOVESPA.fromJson(json['IFIX']) : null;
    nASDAQ =
        json['NASDAQ'] != null ? new IBOVESPA.fromJson(json['NASDAQ']) : null;
    dOWJONES = json['DOWJONES'] != null
        ? new IBOVESPA.fromJson(json['DOWJONES'])
        : null;
    cAC = json['CAC'] != null ? new IBOVESPA.fromJson(json['CAC']) : null;
    nIKKEI =
        json['NIKKEI'] != null ? new IBOVESPA.fromJson(json['NIKKEI']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iBOVESPA != null) {
      data['IBOVESPA'] = this.iBOVESPA!.toJson();
    }
    if (this.iFIX != null) {
      data['IFIX'] = this.iFIX!.toJson();
    }
    if (this.nASDAQ != null) {
      data['NASDAQ'] = this.nASDAQ!.toJson();
    }
    if (this.dOWJONES != null) {
      data['DOWJONES'] = this.dOWJONES!.toJson();
    }
    if (this.cAC != null) {
      data['CAC'] = this.cAC!.toJson();
    }
    if (this.nIKKEI != null) {
      data['NIKKEI'] = this.nIKKEI!.toJson();
    }
    return data;
  }
}
