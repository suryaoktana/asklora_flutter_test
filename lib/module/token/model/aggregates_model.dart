class AggregatesModel {
  String? ev;
  String? pair;
  double? v;
  double? vw;
  double? z;
  double? o;
  double? c;
  double? h;
  double? l;
  int? s;
  int? e;

  AggregatesModel(
      {this.ev,
        this.pair,
        this.v,
        this.vw,
        this.z,
        this.o,
        this.c,
        this.h,
        this.l,
        this.s,
        this.e});

  AggregatesModel.fromJson(Map<String, dynamic> json) {
    ev = json['ev'];
    pair = json['pair'];
    if (json['v']!=null) {
      v = json['v'].toDouble();
    } else {
      v = null;
    }
    if (json['vw']!=null) {
      vw = json['vw'].toDouble();
    } else {
      vw = null;
    }
    if (json['z']!=null) {
      z = json['z'].toDouble();
    } else {
      z = null;
    }
    if (json['o']!=null) {
      o = json['o'].toDouble();
    } else {
      o = null;
    }
    if (json['c']!=null) {
      c = json['c'].toDouble();
    } else {
      c = null;
    }
    if (json['h']!=null) {
      h = json['h'].toDouble();
    } else {
      h = null;
    }
    if (json['l']!=null) {
      l = json['l'].toDouble();
    } else {
      l = null;
    }
    s = json['s'];
    e = json['e'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ev'] = this.ev;
    data['pair'] = this.pair;
    data['v'] = this.v;
    data['vw'] = this.vw;
    data['z'] = this.z;
    data['o'] = this.o;
    data['c'] = this.c;
    data['h'] = this.h;
    data['l'] = this.l;
    data['s'] = this.s;
    data['e'] = this.e;
    return data;
  }
}
