import 'package:cripto/models/bitstamp.model.dart';
import 'package:cripto/models/blockchain.model.dart';
import 'package:cripto/models/coinbase.model.dart';
import 'package:cripto/models/mercadobitcoin.model.dart';

class Bitcoin {
  BlockchainInfo? blockchainInfo;
  Coinbase? coinbase;
  Bitstamp? bitstamp;
  Coinbase? foxbit;
  Mercadobitcoin? mercadobitcoin;

  Bitcoin(
      {this.blockchainInfo,
      this.coinbase,
      this.bitstamp,
      this.foxbit,
      this.mercadobitcoin});

  Bitcoin.fromJson(Map<String, dynamic> json) {
    blockchainInfo = json['blockchain_info'] != null
        ? new BlockchainInfo.fromJson(json['blockchain_info'])
        : null;
    coinbase = json['coinbase'] != null
        ? new Coinbase.fromJson(json['coinbase'])
        : null;
    bitstamp = json['bitstamp'] != null
        ? new Bitstamp.fromJson(json['bitstamp'])
        : null;
    foxbit =
        json['foxbit'] != null ? new Coinbase.fromJson(json['foxbit']) : null;
    mercadobitcoin = json['mercadobitcoin'] != null
        ? new Mercadobitcoin.fromJson(json['mercadobitcoin'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blockchainInfo != null) {
      data['blockchain_info'] = this.blockchainInfo!.toJson();
    }
    if (this.coinbase != null) {
      data['coinbase'] = this.coinbase!.toJson();
    }
    if (this.bitstamp != null) {
      data['bitstamp'] = this.bitstamp!.toJson();
    }
    if (this.foxbit != null) {
      data['foxbit'] = this.foxbit!.toJson();
    }
    if (this.mercadobitcoin != null) {
      data['mercadobitcoin'] = this.mercadobitcoin!.toJson();
    }
    return data;
  }
}
