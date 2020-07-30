import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var activeCasesAn;
var recoveredCasesAn;
var testedCasesAn;
var activeCasesAp;
var recoveredCasesAp;
var testedCasesAp;
var activeCasesAr;
var recoveredCasesAr;
var testedCasesAr;
var activeCasesAs;
var recoveredCasesAs;
var testedCasesAs;
var activeCasesBi;
var recoveredCasesBi;
var testedCasesBi;
class StateList extends StatelessWidget{
  void getData() async{
    http.Response response=await http.get('https://api.covid19india.org/v4/data.json?api_key=%E2%80%9C3ad5ab2eaf05830044bfabbd1690e1dfe3124de7%E2%80%9D');
    if(response.statusCode==200){
      String data = response.body;
       activeCasesAn=jsonDecode(data)['AN']['total']['confirmed'];//active cases of andaman
       recoveredCasesAn=jsonDecode(data)['AN']['total']['recovered'];//recovered cases of andaman
       testedCasesAn=jsonDecode(data)['AN']['total']['tested'];//tested cases of andaman
      activeCasesAp=jsonDecode(data)['AP']['total']['confirmed'];//active cases of Andhra Pradesh
      recoveredCasesAp=jsonDecode(data)['AP']['total']['recovered'];//recovered cases of Andhra Pradesh
      testedCasesAp=jsonDecode(data)['AP']['total']['tested'];//tested cases of Andhra Pradesh
      activeCasesAr=jsonDecode(data)['AR']['total']['confirmed'];//active cases of Arunachal pradesh
      recoveredCasesAr=jsonDecode(data)['AR']['total']['recovered'];//recovered cases of Arunachal Pradesh
      testedCasesAr=jsonDecode(data)['AR']['total']['tested'];//tested cases of Arunachal Pradesh
      activeCasesAs=jsonDecode(data)['AS']['total']['confirmed'];//active cases of Assam
      recoveredCasesAs=jsonDecode(data)['AS']['total']['recovered'];//recovered cases of Assam
      testedCasesAs=jsonDecode(data)['AS']['total']['tested'];//tested cases of Assam
      activeCasesBi=jsonDecode(data)['BR']['total']['confirmed'];//active cases of Bihar
      recoveredCasesBi=jsonDecode(data)['BR']['total']['recovered'];//recovered cases of Bihar
      testedCasesBi=jsonDecode(data)['BR']['total']['tested'];//tested cases of Bihar
    }
    else{
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    getData();
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
            Padding(
              padding: const EdgeInsets.only(top:28.0,left: 8,right: 8),
              child: DetailCards(state:"Andaman",activeCases: activeCasesAn.toString(),recoveredCases: recoveredCasesAn.toString(),testedCases: testedCasesAn.toString(),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:28.0,left: 8,right: 8),
              child: DetailCards(state:"Andhra Pradesh",activeCases: activeCasesAp.toString(),recoveredCases: recoveredCasesAp.toString(),testedCases: testedCasesAp.toString(),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:28.0,left: 8,right: 8),
              child: DetailCards(state:"Arunachal Pradesh",activeCases: activeCasesAr.toString(),recoveredCases: recoveredCasesAr.toString(),testedCases: testedCasesAr.toString(),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:28.0,left: 8,right: 8),
              child: DetailCards(state:"Assam",activeCases: activeCasesAs.toString(),recoveredCases: recoveredCasesAs.toString(),testedCases: testedCasesAs.toString(),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:28.0,left: 8,right: 8),
              child: DetailCards(state:"Bihar",activeCases: activeCasesBi.toString(),recoveredCases: recoveredCasesBi.toString(),testedCases: testedCasesBi.toString(),),
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