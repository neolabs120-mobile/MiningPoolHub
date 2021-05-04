class Model {
  Getuserallbalances getuserallbalances;

  Model({this.getuserallbalances});

  Model.fromJson(Map<String, dynamic> json) {
    getuserallbalances = json['getuserallbalances'] != null
        ? new Getuserallbalances.fromJson(json['getuserallbalances'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getuserallbalances != null) {
      data['getuserallbalances'] = this.getuserallbalances.toJson();
    }
    return data;
  }
}

class Getuserallbalances {
  String version;
  dynamic runtime;
  List<Data> data;

  Getuserallbalances({this.version, this.runtime, this.data});

  Getuserallbalances.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    runtime = json['runtime'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['runtime'] = this.runtime;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String coin;
  dynamic confirmed;
  //dynamic unconfirmed;
  dynamic aeConfirmed;
  dynamic aeUnconfirmed;
  dynamic exchange;

  Data(
      {this.coin,
        this.confirmed,
        //this.unconfirmed,
        this.aeConfirmed,
        this.aeUnconfirmed,
        this.exchange});

  Data.fromJson(Map<String, dynamic> json) {
    coin = json['coin'];
    confirmed = json['confirmed'];
    //unconfirmed = json['unconfirmed'];
    aeConfirmed = json['ae_confirmed'];
    aeUnconfirmed = json['ae_unconfirmed'];
    exchange = json['exchange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coin'] = this.coin;
    data['confirmed'] = this.confirmed;
    //data['unconfirmed'] = this.unconfirmed;
    data['ae_confirmed'] = this.aeConfirmed;
    data['ae_unconfirmed'] = this.aeUnconfirmed;
    data['exchange'] = this.exchange;
    return data;
  }
}