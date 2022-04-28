class SnapshotModel {
  String? status;
  List<Tickers>? tickers;

  SnapshotModel({this.status, this.tickers});

  SnapshotModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['tickers'] != null) {
      tickers = <Tickers>[];
      json['tickers'].forEach((v) {
        tickers!.add(new Tickers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.tickers != null) {
      data['tickers'] = this.tickers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tickers {
  Day? day;
  LastTrade? lastTrade;
  Day? min;
  Day? prevDay;
  String? ticker;
  double? todaysChange;
  double? todaysChangePerc;
  int? updated;

  Tickers(
      {this.day,
        this.lastTrade,
        this.min,
        this.prevDay,
        this.ticker,
        this.todaysChange,
        this.todaysChangePerc,
        this.updated});

  Tickers.fromJson(Map<String, dynamic> json) {
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    lastTrade = json['lastTrade'] != null
        ? new LastTrade.fromJson(json['lastTrade'])
        : null;
    min = json['min'] != null ? new Day.fromJson(json['min']) : null;
    prevDay =
    json['prevDay'] != null ? new Day.fromJson(json['prevDay']) : null;
    ticker = json['ticker'];
    if (json['todaysChange']!=null) {
      todaysChange = json['todaysChange'].toDouble();
    } else {
      todaysChange = null;
    }
    if (json['todaysChangePerc']!=null) {
      todaysChangePerc = json['todaysChangePerc'].toDouble();
    } else {
      todaysChangePerc = null;
    }
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.day != null) {
      data['day'] = this.day!.toJson();
    }
    if (this.lastTrade != null) {
      data['lastTrade'] = this.lastTrade!.toJson();
    }
    if (this.min != null) {
      data['min'] = this.min!.toJson();
    }
    if (this.prevDay != null) {
      data['prevDay'] = this.prevDay!.toJson();
    }
    data['ticker'] = this.ticker;
    data['todaysChange'] = this.todaysChange;
    data['todaysChangePerc'] = this.todaysChangePerc;
    data['updated'] = this.updated;
    return data;
  }
}

class Day {
  double? c;
  double? h;
  double? l;
  double? o;
  double? v;
  double? vw;

  Day({this.c, this.h, this.l, this.o, this.v, this.vw});

  Day.fromJson(Map<String, dynamic> json) {
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
    if (json['o']!=null) {
      o = json['o'].toDouble();
    } else {
      o = null;
    }
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c'] = this.c;
    data['h'] = this.h;
    data['l'] = this.l;
    data['o'] = this.o;
    data['v'] = this.v;
    data['vw'] = this.vw;
    return data;
  }
}

class LastTrade {
  List<int>? c;
  String? i;
  double? p;
  double? s;
  double? t;
  double? x;

  LastTrade({this.c, this.i, this.p, this.s, this.t, this.x});

  LastTrade.fromJson(Map<String, dynamic> json) {
    if(json['c']!=null){
      c = json['c'].cast<int>();
    }
    else{
      c = null;
    }

    i = json['i'];
    if (json['p']!=null) {
      p = json['p'].toDouble();
    } else {
      p = null;
    }
    if (json['s']!=null) {
      s = json['s'].toDouble();
    } else {
      s = null;
    }
    if (json['t']!=null) {
      t = json['t'].toDouble();
    } else {
      t = null;
    }
    if (json['x']!=null) {
      x = json['x'].toDouble();
    } else {
      x = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['c'] = this.c;
    data['i'] = this.i;
    data['p'] = this.p;
    data['s'] = this.s;
    data['t'] = this.t;
    data['x'] = this.x;
    return data;
  }
}

