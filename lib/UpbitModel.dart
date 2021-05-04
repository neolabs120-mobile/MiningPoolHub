class UpbitModel {
  String market;
  String tradeDate;
  String tradeTime;
  String tradeDateKst;
  String tradeTimeKst;
  dynamic tradeTimestamp;
  dynamic openingPrice;
  dynamic highPrice;
  dynamic lowPrice;
  dynamic tradePrice;
  dynamic prevClosingPrice;
  String change;
  dynamic changePrice;
  dynamic changeRate;
  dynamic signedChangePrice;
  dynamic signedChangeRate;
  dynamic tradeVolume;
  dynamic accTradePrice;
  dynamic accTradePrice24h;
  dynamic accTradeVolume;
  dynamic accTradeVolume24h;
  dynamic highest52WeekPrice;
  String highest52WeekDate;
  dynamic lowest52WeekPrice;
  String lowest52WeekDate;
  dynamic timestamp;

  UpbitModel(
      {this.market,
        this.tradeDate,
        this.tradeTime,
        this.tradeDateKst,
        this.tradeTimeKst,
        this.tradeTimestamp,
        this.openingPrice,
        this.highPrice,
        this.lowPrice,
        this.tradePrice,
        this.prevClosingPrice,
        this.change,
        this.changePrice,
        this.changeRate,
        this.signedChangePrice,
        this.signedChangeRate,
        this.tradeVolume,
        this.accTradePrice,
        this.accTradePrice24h,
        this.accTradeVolume,
        this.accTradeVolume24h,
        this.highest52WeekPrice,
        this.highest52WeekDate,
        this.lowest52WeekPrice,
        this.lowest52WeekDate,
        this.timestamp});

  UpbitModel.fromJson(Map<String, dynamic> json) {
    market = json['market'];
    tradeDate = json['trade_date'];
    tradeTime = json['trade_time'];
    tradeDateKst = json['trade_date_kst'];
    tradeTimeKst = json['trade_time_kst'];
    tradeTimestamp = json['trade_timestamp'];
    openingPrice = json['opening_price'];
    highPrice = json['high_price'];
    lowPrice = json['low_price'];
    tradePrice = json['trade_price'];
    prevClosingPrice = json['prev_closing_price'];
    change = json['change'];
    changePrice = json['change_price'];
    changeRate = json['change_rate'];
    signedChangePrice = json['signed_change_price'];
    signedChangeRate = json['signed_change_rate'];
    tradeVolume = json['trade_volume'];
    accTradePrice = json['acc_trade_price'];
    accTradePrice24h = json['acc_trade_price_24h'];
    accTradeVolume = json['acc_trade_volume'];
    accTradeVolume24h = json['acc_trade_volume_24h'];
    highest52WeekPrice = json['highest_52_week_price'];
    highest52WeekDate = json['highest_52_week_date'];
    lowest52WeekPrice = json['lowest_52_week_price'];
    lowest52WeekDate = json['lowest_52_week_date'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['market'] = this.market;
    data['trade_date'] = this.tradeDate;
    data['trade_time'] = this.tradeTime;
    data['trade_date_kst'] = this.tradeDateKst;
    data['trade_time_kst'] = this.tradeTimeKst;
    data['trade_timestamp'] = this.tradeTimestamp;
    data['opening_price'] = this.openingPrice;
    data['high_price'] = this.highPrice;
    data['low_price'] = this.lowPrice;
    data['trade_price'] = this.tradePrice;
    data['prev_closing_price'] = this.prevClosingPrice;
    data['change'] = this.change;
    data['change_price'] = this.changePrice;
    data['change_rate'] = this.changeRate;
    data['signed_change_price'] = this.signedChangePrice;
    data['signed_change_rate'] = this.signedChangeRate;
    data['trade_volume'] = this.tradeVolume;
    data['acc_trade_price'] = this.accTradePrice;
    data['acc_trade_price_24h'] = this.accTradePrice24h;
    data['acc_trade_volume'] = this.accTradeVolume;
    data['acc_trade_volume_24h'] = this.accTradeVolume24h;
    data['highest_52_week_price'] = this.highest52WeekPrice;
    data['highest_52_week_date'] = this.highest52WeekDate;
    data['lowest_52_week_price'] = this.lowest52WeekPrice;
    data['lowest_52_week_date'] = this.lowest52WeekDate;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
