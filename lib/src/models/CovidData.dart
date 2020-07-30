import 'dart:convert';

class CovidData {

  List<String> state=["AN","AP"];

  int getActiveCases(int i){
    return jsonDecode(data)[state[i]]['total']['confirmed'];
  }
 int getRecoveredCases(int i){
   return jsonDecode(data)[state[i]]['total']['recovered'];
 }
 int getTestedCases(int i){
   return jsonDecode(data)[state[i]]['total']['tested'];
 }
}