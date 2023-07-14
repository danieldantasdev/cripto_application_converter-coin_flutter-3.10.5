class Mercadobitcoin {
  String? name;
  List<String>? format;
  double? last;
  double? buy;
  double? sell;
  double? variation;

  Mercadobitcoin(
      {this.name, this.format, this.last, this.buy, this.sell, this.variation});

  Mercadobitcoin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    format = json['format'].cast<String>();
    last = json['last'];
    buy = json['buy'];
    sell = json['sell'];
    variation = json['variation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['format'] = this.format;
    data['last'] = this.last;
    data['buy'] = this.buy;
    data['sell'] = this.sell;
    data['variation'] = this.variation;
    return data;
  }
}
