import 'package:flutter/material.dart';

class StateList extends StatelessWidget {
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
            Padding(
              padding: const EdgeInsets.only(top:28.0,left: 8,right: 8),
              child: DetailCards(state:"Andaman",activeCases: "12",data1: "23",),
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
  final String data1;
  DetailCards({this.state,this.activeCases,this.data1});
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
               padding: const EdgeInsets.only(top:8.0,left: 56),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(activeCases,style: TextStyle(
                       fontSize: 15
                   ),),
                   Text(data1,style: TextStyle(
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
