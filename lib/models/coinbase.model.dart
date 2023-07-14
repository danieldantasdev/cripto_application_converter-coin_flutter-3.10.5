class Coinbase {
  String? name;
  List<String>? format;
  double? last;
  double? variation;

  Coinbase({this.name, this.format, this.last, this.variation});

  Coinbase.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    format = json['format'].cast<String>();
    last = json['last'];
    variation = json['variation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['format'] = this.format;
    data['last'] = this.last;
    data['variation'] = this.variation;
    return data;
  }
}
