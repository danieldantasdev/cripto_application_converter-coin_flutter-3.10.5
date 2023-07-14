import 'package:cripto/models/result.model.dart';

class Coin {
  String? by;
  bool? validKey;
  Result? results;
  double? executionTime;
  bool? fromCache;

  Coin(
      {this.by,
      this.validKey,
      this.results,
      this.executionTime,
      this.fromCache});

  Coin.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    validKey = json['valid_key'];
    results =
        json['results'] != null ? new Result.fromJson(json['results']) : null;
    executionTime = json['execution_time'];
    fromCache = json['from_cache'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['by'] = this.by;
    data['valid_key'] = this.validKey;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    data['execution_time'] = this.executionTime;
    data['from_cache'] = this.fromCache;
    return data;
  }
}
