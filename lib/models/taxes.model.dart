class Taxes {
  String? date;
  double? cdi;
  double? selic;
  double? dailyFactor;
  double? selicDaily;
  double? cdiDaily;

  Taxes(
      {this.date,
      this.cdi,
      this.selic,
      this.dailyFactor,
      this.selicDaily,
      this.cdiDaily});

  Taxes.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    cdi = json['cdi'];
    selic = json['selic'];
    dailyFactor = json['daily_factor'];
    selicDaily = json['selic_daily'];
    cdiDaily = json['cdi_daily'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['cdi'] = this.cdi;
    data['selic'] = this.selic;
    data['daily_factor'] = this.dailyFactor;
    data['selic_daily'] = this.selicDaily;
    data['cdi_daily'] = this.cdiDaily;
    return data;
  }
}
