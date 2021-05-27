class DataModel {
  Getdashboarddata getdashboarddata;

  DataModel({this.getdashboarddata});

  DataModel.fromJson(Map<String, dynamic> json) {
    getdashboarddata = json['getdashboarddata'] != null
        ? new Getdashboarddata.fromJson(json['getdashboarddata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getdashboarddata != null) {
      data['getdashboarddata'] = this.getdashboarddata.toJson();
    }
    return data;
  }
}

class Getdashboarddata {
  dynamic version;
  dynamic runtime;
  Data data;

  Getdashboarddata({this.version, this.runtime, this.data});

  Getdashboarddata.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    runtime = json['runtime'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['runtime'] = this.runtime;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Raw raw;
  Personal personal;
  Balance balance;
  BalanceForAutoExchange balanceForAutoExchange;
  dynamic balanceOnExchange;
  RecentCredits24hours recentCredits24hours;
  List<RecentCredits> recentCredits;
  Personal pool;
  System system;
  Network network;

  Data(
      {this.raw,
        this.personal,
        this.balance,
        this.balanceForAutoExchange,
        this.balanceOnExchange,
        this.recentCredits24hours,
        this.recentCredits,
        this.pool,
        this.system,
        this.network});

  Data.fromJson(Map<String, dynamic> json) {
    raw = json['raw'] != null ? new Raw.fromJson(json['raw']) : null;
    personal = json['personal'] != null
        ? new Personal.fromJson(json['personal'])
        : null;
    balance =
    json['balance'] != null ? new Balance.fromJson(json['balance']) : null;
    balanceForAutoExchange = json['balance_for_auto_exchange'] != null
        ? new BalanceForAutoExchange.fromJson(json['balance_for_auto_exchange'])
        : null;
    balanceOnExchange = json['balance_on_exchange'];
    recentCredits24hours = json['recent_credits_24hours'] != null
        ? new RecentCredits24hours.fromJson(json['recent_credits_24hours'])
        : null;
    if (json['recent_credits'] != null) {
      recentCredits = new List<RecentCredits>();
      json['recent_credits'].forEach((v) {
        recentCredits.add(new RecentCredits.fromJson(v));
      });
    }
    pool = json['pool'] != null ? new Personal.fromJson(json['pool']) : null;
    system =
    json['system'] != null ? new System.fromJson(json['system']) : null;
    network =
    json['network'] != null ? new Network.fromJson(json['network']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.raw != null) {
      data['raw'] = this.raw.toJson();
    }
    if (this.personal != null) {
      data['personal'] = this.personal.toJson();
    }
    if (this.balance != null) {
      data['balance'] = this.balance.toJson();
    }
    if (this.balanceForAutoExchange != null) {
      data['balance_for_auto_exchange'] = this.balanceForAutoExchange.toJson();
    }
    data['balance_on_exchange'] = this.balanceOnExchange;
    if (this.recentCredits24hours != null) {
      data['recent_credits_24hours'] = this.recentCredits24hours.toJson();
    }
    if (this.recentCredits != null) {
      data['recent_credits'] =
          this.recentCredits.map((v) => v.toJson()).toList();
    }
    if (this.pool != null) {
      data['pool'] = this.pool.toJson();
    }
    if (this.system != null) {
      data['system'] = this.system.toJson();
    }
    if (this.network != null) {
      data['network'] = this.network.toJson();
    }
    return data;
  }
}

class Raw {
  Personal personal;
  Personal pool;
  Network network;

  Raw({this.personal, this.pool, this.network});

  Raw.fromJson(Map<String, dynamic> json) {
    personal = json['personal'] != null
        ? new Personal.fromJson(json['personal'])
        : null;
    pool = json['pool'] != null ? new Personal.fromJson(json['pool']) : null;
    network =
    json['network'] != null ? new Network.fromJson(json['network']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personal != null) {
      data['personal'] = this.personal.toJson();
    }
    if (this.pool != null) {
      data['pool'] = this.pool.toJson();
    }
    if (this.network != null) {
      data['network'] = this.network.toJson();
    }
    return data;
  }
}

class Personal {
  dynamic hashrate;

  Personal({this.hashrate});

  Personal.fromJson(Map<String, dynamic> json) {
    hashrate = json['hashrate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hashrate'] = this.hashrate;
    return data;
  }
}

class Network {
  dynamic hashrate;
  dynamic esttimeperblock;

  Network({this.hashrate, this.esttimeperblock});

  Network.fromJson(Map<String, dynamic> json) {
    hashrate = json['hashrate'];
    esttimeperblock = json['esttimeperblock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hashrate'] = this.hashrate;
    data['esttimeperblock'] = this.esttimeperblock;
    return data;
  }
}

class Personal2 {
  dynamic hashrate;
  dynamic sharerate;
  dynamic sharedifficulty;
  dynamic shares;
  Estimates estimates;

  Personal2(
      {this.hashrate,
        this.sharerate,
        this.sharedifficulty,
        this.shares,
        this.estimates});

  Personal2.fromJson(Map<String, dynamic> json) {
    hashrate = json['hashrate'];
    sharerate = json['sharerate'];
    sharedifficulty = json['sharedifficulty'];
    shares =
    json['shares'] != null ? new Shares.fromJson(json['shares']) : null;
    estimates = json['estimates'] != null
        ? new Estimates.fromJson(json['estimates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hashrate'] = this.hashrate;
    data['sharerate'] = this.sharerate;
    data['sharedifficulty'] = this.sharedifficulty;
    if (this.shares != null) {
      data['shares'] = this.shares.toJson();
    }
    if (this.estimates != null) {
      data['estimates'] = this.estimates.toJson();
    }
    return data;
  }
}

class Shares {
  dynamic valid;
  dynamic invalid;
  dynamic invalidPercent;
  dynamic unpaid;

  Shares({this.valid, this.invalid, this.invalidPercent, this.unpaid});

  Shares.fromJson(Map<String, dynamic> json) {
    valid = json['valid'];
    invalid = json['invalid'];
    invalidPercent = json['invalid_percent'];
    unpaid = json['unpaid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valid'] = this.valid;
    data['invalid'] = this.invalid;
    data['invalid_percent'] = this.invalidPercent;
    data['unpaid'] = this.unpaid;
    return data;
  }
}

class Estimates {
  dynamic block;
  dynamic fee;
  dynamic donation;
  dynamic payout;

  Estimates({this.block, this.fee, this.donation, this.payout});

  Estimates.fromJson(Map<String, dynamic> json) {
    block = json['block'];
    fee = json['fee'];
    donation = json['donation'];
    payout = json['payout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['block'] = this.block;
    data['fee'] = this.fee;
    data['donation'] = this.donation;
    data['payout'] = this.payout;
    return data;
  }
}

class Balance {
  dynamic confirmed;
  dynamic unconfirmed;

  Balance({this.confirmed, this.unconfirmed});

  Balance.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    unconfirmed = json['unconfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['unconfirmed'] = this.unconfirmed;
    return data;
  }
}

class BalanceForAutoExchange {
  dynamic confirmed;
  dynamic unconfirmed;

  BalanceForAutoExchange({this.confirmed, this.unconfirmed});

  BalanceForAutoExchange.fromJson(Map<String, dynamic> json) {
    confirmed = json['confirmed'];
    unconfirmed = json['unconfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['confirmed'] = this.confirmed;
    data['unconfirmed'] = this.unconfirmed;
    return data;
  }
}

class RecentCredits24hours {
  dynamic amount;

  RecentCredits24hours({this.amount});

  RecentCredits24hours.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    return data;
  }
}

class RecentCredits {
  dynamic date;
  dynamic amount;

  RecentCredits({this.date, this.amount});

  RecentCredits.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['amount'] = this.amount;
    return data;
  }
}

class Pool {
  Info info;
  dynamic workers;
  dynamic hashrate;
  Shares shares;
  dynamic price;
  dynamic difficulty;
  dynamic targetBits;

  Pool(
      {this.info,
        this.workers,
        this.hashrate,
        this.shares,
        this.price,
        this.difficulty,
        this.targetBits});

  Pool.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    workers = json['workers'];
    hashrate = json['hashrate'];
    shares =
    json['shares'] != null ? new Shares.fromJson(json['shares']) : null;
    price = json['price'];
    difficulty = json['difficulty'];
    targetBits = json['target_bits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    data['workers'] = this.workers;
    data['hashrate'] = this.hashrate;
    if (this.shares != null) {
      data['shares'] = this.shares.toJson();
    }
    data['price'] = this.price;
    data['difficulty'] = this.difficulty;
    data['target_bits'] = this.targetBits;
    return data;
  }
}

class Info {
  dynamic name;
  dynamic currency;

  Info({this.name, this.currency});

  Info.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['currency'] = this.currency;
    return data;
  }
}

class Shares2 {
  dynamic valid;
  dynamic invalid;
  dynamic invalidPercent;
  dynamic estimated;
  dynamic progress;

  Shares2(
      {this.valid,
        this.invalid,
        this.invalidPercent,
        this.estimated,
        this.progress});

  Shares2.fromJson(Map<String, dynamic> json) {
    valid = json['valid'];
    invalid = json['invalid'];
    invalidPercent = json['invalid_percent'];
    estimated = json['estimated'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valid'] = this.valid;
    data['invalid'] = this.invalid;
    data['invalid_percent'] = this.invalidPercent;
    data['estimated'] = this.estimated;
    data['progress'] = this.progress;
    return data;
  }
}

class System {
  List<double> load;

  System({this.load});

  System.fromJson(Map<String, dynamic> json) {
    load = json['load'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['load'] = this.load;
    return data;
  }
}

class Network2 {
  dynamic hashrate;
  dynamic difficulty;
  dynamic block;
  dynamic esttimeperblock;

  Network2({this.hashrate, this.difficulty, this.block, this.esttimeperblock});

  Network2.fromJson(Map<String, dynamic> json) {
    hashrate = json['hashrate'];
    difficulty = json['difficulty'];
    block = json['block'];
    esttimeperblock = json['esttimeperblock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hashrate'] = this.hashrate;
    data['difficulty'] = this.difficulty;
    data['block'] = this.block;
    data['esttimeperblock'] = this.esttimeperblock;
    return data;
  }
}