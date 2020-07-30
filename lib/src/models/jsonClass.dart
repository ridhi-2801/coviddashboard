import 'dart:convert';
import 'package:http/http.dart' as http;
class Json {
 String data;
  List<String> state=["AN","AP","AR"];
  void getData() async{
    http.Response response=await http.get('https://api.covid19india.org/v4/data.json?api_key=%E2%80%9C3ad5ab2eaf05830044bfabbd1690e1dfe3124de7%E2%80%9D');
    if(response.statusCode==200){
    data = response.body;
    }
    else{
      print(response.statusCode);
    }
  }
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