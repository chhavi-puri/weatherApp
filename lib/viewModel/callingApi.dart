import 'dart:convert';

import 'package:newweather/database/data.dart';
import 'package:newweather/model/weatherDetails.dart';
Data datas=Data();
Future<List<WeatherDetails>> converting(response) async
{
List varia= jsonDecode(response.body);
   return (varia).map((data) {
      print('Inserting $data');
      datas.insertData(WeatherDetails.fromJson(data));}).toList();
 
}