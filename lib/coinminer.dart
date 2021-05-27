import 'dart:convert';
import 'dart:ui';
import 'package:CoinMiner/DataModel.dart';
import 'package:CoinMiner/UpbitModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:CoinMiner/Model.dart';
import 'dart:developer';

void main() {
  runApp(CoinminerMain());
}

class CreditModel {
  dynamic date;
  dynamic amount;

  CreditModel(dynamic date, dynamic amount) {
    this.date = date;
    this.amount = amount;
  }
}

class CoinminerMain extends StatelessWidget {
  final String apikey;
  CoinminerMain({Key key, @required this.apikey}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinminer Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Miner(title: 'Coinminer info', apikey: apikey),
    );
  }
}

class Miner extends StatefulWidget {
  Miner({Key key, this.title, this.apikey}) : super(key: key);
  final String title;
  final String apikey;

  @override
  Coinminer createState() => Coinminer(apikey: apikey);
}

class PersonTile extends StatelessWidget {
  PersonTile(this._person);

  final CreditModel _person;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_person.date),
      subtitle: Text(_person.amount.toString() + "원"),
    );
  }
}

class Coinminer extends State<Miner> {
  var apikey;
  Coinminer({this.apikey});

  Future<Model> futurecoin;
  Future<UpbitModel> upbit;
  Future<String> result;
  Future<DataModel> datamodel;
  Future<List<CreditModel>> creditmodel;

  Future<Model> getinfo() async {
    String url = "https://miningpoolhub.com/index.php?page=api&action=getuserallbalances&api_key=4f229689857dd1c7e97d132ec22d96245e98c4ab860846ef08116b9205d8e462";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(response.toString());
      return Model.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<UpbitModel> getupbitinfo() async {
    String upbiturl = "https://api.upbit.com/v1/ticker?markets=KRW-ETH";
    final response = await http.get(upbiturl);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(response.body);
      var responsestring = response.body;
      responsestring = responsestring.substring(1, responsestring.length - 1);
      return UpbitModel.fromJson(jsonDecode(responsestring));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<DataModel> getdateinfo() async {
    String networkurl = "https://ethereum.miningpoolhub.com/index.php?page=api&action=getdashboarddata&api_key=4f229689857dd1c7e97d132ec22d96245e98c4ab860846ef08116b9205d8e462";
    final response = await http.get(networkurl);

    if (response.statusCode == 200) {
      log(response.body);
      var responsestring2 = response.body;
      return DataModel.fromJson(jsonDecode(responsestring2));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<String> getresult() async {
    Model model;
    UpbitModel upbitmodel;

    model = await getinfo();
    upbitmodel = await getupbitinfo();

    var index = 0;

    for(int i = 0; i < model.getuserallbalances.data.length; i++) {
      if(model.getuserallbalances.data.elementAt(i).coin == "ethereum") {
        index = i;
      }
    }

    return (model.getuserallbalances.data.elementAt(index).confirmed * upbitmodel.tradePrice).round().toString();
  }

  Future<List<CreditModel>> getcredit() async {
    DataModel dataModel;
    UpbitModel upbitmodel;
    List<CreditModel> creditmodel = new List<CreditModel>();

    dataModel = await getdateinfo();
    upbitmodel = await getupbitinfo();

    for(int i = 0; i < dataModel.getdashboarddata.data.recentCredits.length; i++) {
      creditmodel.add(CreditModel(dataModel.getdashboarddata.data.recentCredits.elementAt(i).date, (dataModel.getdashboarddata.data.recentCredits.elementAt(i).amount * upbitmodel.tradePrice).round()));
    }

    return creditmodel;
  }

  @override
  void initState() {
    super.initState();
    futurecoin = getinfo();
    upbit = getupbitinfo();
    result = getresult();
    datamodel = getdateinfo();
    creditmodel = getcredit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            FutureBuilder<String>(
              future: result,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //return Text(snapshot.data.getuserallbalances.data.elementAt(1).confirmed.toString());
                  return Text("현재 채굴한 이더리움 원화 환산 : " + snapshot.data + "원", style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  ));
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
            FutureBuilder<List<CreditModel>>(
              future: creditmodel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PersonTile(snapshot.data.elementAt(index));
                        },
                      )
                  );
                } else if (snapshot.hasError) {
                  log(snapshot.error);
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ],
        )
    );
  }
}
