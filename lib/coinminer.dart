import 'dart:convert';
import 'package:CoinMiner/UpbitModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:CoinMiner/Model.dart';
import 'dart:developer';

void main() {
  runApp(CoinminerMain());
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

class Coinminer extends State<Miner> {
  var apikey;
  Coinminer({this.apikey});

  Future<Model> futurecoin;
  Future<UpbitModel> upbit;
  Future<String> result;

  Future<Model> getinfo() async {
    String url = "https://miningpoolhub.com/index.php?page=api&action=getuserallbalances&api_key=" + apikey;
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

  @override
  void initState() {
    super.initState();
    futurecoin = getinfo();
    upbit = getupbitinfo();
    result = getresult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: result,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data.getuserallbalances.data.elementAt(1).confirmed.toString());
                return Text("현재 채굴한 이더리움 원화 환산 : " + snapshot.data + "원");
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        )
    );
  }
}
