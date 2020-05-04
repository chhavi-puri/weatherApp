import 'package:newweather/model/weatherDetails.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class Data{
  Database weatherDatabase;
   openDb() async{
     print('inside opendb');
    if(weatherDatabase==null)
    {
      print('weatherDatabase is null');
      weatherDatabase=await openDatabase(
        join(await getDatabasesPath(),"weatherdatabase.db"),
        version:1,
        onCreate: (Database db , int version) async
        {
          await db.execute("CREATE TABLE weatherDataTable(id INTEGER PRIMARY KEY AUTOINCREMENT, minTemperature TEXT, maxTemperature TEXT, weatherDetails TEXT, date TEXT)");
        }
      );
    }
    else
    {
      print('not null');
    return weatherDatabase;
    }
  } 
  insertData(WeatherDetails weatherDatas) async//insert
  {
     await  openDb(); 
    //  await deleteAllData();
      print('inside insert ${weatherDatas.date}');
      final res= await weatherDatabase.insert('weatherDataTable', weatherDatas.toJson());
      // print('json data is ${weatherDatas.toJson()}');
      // print ('res is $res');
       return res;
  }
Future <List<WeatherDetails>> getWeatherData() async//fetch
{
    print('inside getWeatherDetails');
  await openDb();
  final res= await weatherDatabase.query('weatherDataTable');
  print('res is $res');
  
  return List.generate(res.length, (i){
  print(res[i]['date']);
      return WeatherDetails(
        minTemperature: res[i]['minTemperature'],
         maxTemperature: res[i]['maxTemperature'],
         weatherDetails: res[i]['weatherDetails'],
         date: res[i]['date'],
      );
    });
 }
Future<int> deleteAllData() async {//delete all
    final res = await weatherDatabase.rawDelete('DELETE FROM weatherDataTable');
    
    return res;
  }
 update(WeatherDetails weaData) async {
  await openDb();
 final res=  await weatherDatabase.update('weatherDataTable', weaData.toJson(),
    where: 'id=?',
    whereArgs: [weaData.id]
    );
    return res;
}
  }



