import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class StateList extends StatefulWidget {
  @override
  _StateListState createState() => _StateListState();
}

class _StateListState extends State<StateList> {
  List<String> state=["AN","AP","AR","AS"];
  List<String> stateName=["Andaman","Andhra Pradesh","Arunachal Pradesh","Assam"];
  Future future;
  var coronaData;
  Future getData() async {
    http.Response response = await http.get(
        'https://api.covid19india.org/v4/data.json?api_key=%E2%80%9C3ad5ab2eaf05830044bfabbd1690e1dfe3124de7%E2%80%9D');
    if (response.statusCode == 200) {
      String data = response.body;
      coronaData = jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    future = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'States',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                  itemBuilder: (context, index){
                    return Padding(
                      padding:
                      const EdgeInsets.only(top: 28.0, left: 8, right: 8),
                      child: DetailCards(
                        state: stateName[index],
                        activeCases: coronaData[state[index]]['total']['confirmed'].toString(),
                        recoveredCases:
                        coronaData[state[index]]['total']['recovered'].toString(),
                        testedCases: coronaData[state[index]]['total']['tested'].toString(),
                      ),
                    );
                  }
                  ),
            );
          }),
    );
  }
}

class DetailCards extends StatelessWidget {
  final String state;
  final String activeCases;
  final String testedCases;
  final String recoveredCases;
  DetailCards(
      {this.state, this.activeCases, this.recoveredCases, this.testedCases});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height / 4,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 18,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                state,
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26.0, left: 56),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Active Cases: $activeCases",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Recovered Cases: $recoveredCases",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tested Cases: $testedCases",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//f2:62:fd:07:b0:1f:56:f8:c4:ee:a5:b0:19:1a:3e:17:75:c8:49:c0//private key
//3ad5ab2eaf05830044bfabbd1690e1dfe3124de7//client secret
//Iv1.3aa097ec9b7e28a8// client id
//74876 //appid
