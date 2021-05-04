import 'package:CoinMiner/coinminer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinminer Info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Coinminer info'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final myController = TextEditingController();
  SharedPreferences _prefs;
  String counterKey = "apikey";

  initSharedPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    String apikey = _prefs.getString("apikey") ?? "0";

    if(apikey == "0") {

    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => new CoinminerMain(apikey : apikey)),
      );
    }
  }

  setCounterToSharedPrefs(String counter) async {
    _prefs = await SharedPreferences.getInstance();
    // 카운터를 저장한다. string 을 저장할경우 setString 등을 사용할 수 있습니다.
    await _prefs.setString(counterKey, counter);
  }

  @override
  void initState() {
    super.initState();
    initSharedPrefs();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => CoinminerMain(apikey : "")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '마이닝풀허브 API키를 입력해주세요.',
            ),
            TextField(controller: myController,),
            RaisedButton(onPressed: () {
              setState(() {
                setCounterToSharedPrefs(myController.text); // _counter 를 저장합니다
              });
              //다음 화면으로 넘어간다.
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoinminerMain(apikey : myController.text)),
              );
            }, child: Text('코인 현황 조회')),
          ],
        ),
      ),
    );
  }
}
