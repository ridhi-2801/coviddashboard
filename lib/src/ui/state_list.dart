import 'package:coviddashboard/src/models/jsonClass.dart';
import 'package:flutter/material.dart';
import 'package:coviddashboard/src/ui/models/jsonClass.dart';
import 'dart:convert';
Json json=Json();
class StateList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text('States',style: TextStyle(
           color: Colors.white,
         ),),
       ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            for(int i=0;i<36;i++)
              Padding (
                padding: const EdgeInsets.only(top: 28.0, left: 8, right: 8),
                child: DetailCards (state: "Andaman",
                  activeCases: json.getActiveCases (0).toString (),
                  recoveredCases: json.getRecoveredCases (0).toString (),
                  testedCases: json.getTestedCases (0).toString (),),
              ),
              Padding (
                padding: const EdgeInsets.only(top: 28.0, left: 8, right: 8),
                child: DetailCards (state: "Andhra Pradesh",
                  activeCases: json.getActiveCases (1).toString (),
                  recoveredCases: json.getRecoveredCases (1).toString (),
                  testedCases: json.getTestedCases (1).toString (),),
              ),
          ],
        ),
      ),
    );
  }
}

class DetailCards extends StatelessWidget {
  final String state;
  final String activeCases;
  final String testedCases;
  final String recoveredCases;
  DetailCards({this.state,this.activeCases,this.recoveredCases,this.testedCases});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height/4,
      width: double.infinity,
      child: Card(
        color: Colors.white,
       elevation: 18,
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(25),
       ),
        child: Padding(
          padding: const EdgeInsets.only(top:16.0,left: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(state,style: TextStyle(
              fontSize: 20
              ),),
             Padding(
               padding: const EdgeInsets.only(top:26.0,left: 56),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text("Active Cases: $activeCases",style: TextStyle(
                       fontSize: 15
                   ),),
                   SizedBox(height: 10,),
                   Text("Recovered Cases: $recoveredCases",style: TextStyle(
                       fontSize: 15
                   ),),
                   SizedBox(height: 10,),
                   Text("Tested Cases: $testedCases",style: TextStyle(
                       fontSize: 15
                   ),),
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