import 'package:flutter/material.dart';
import 'package:newweather/database/data.dart';
import 'package:newweather/model/boolFunc.dart';
import 'package:newweather/model/mediaQuery.dart';
import 'package:newweather/model/weatherDetails.dart';
import 'package:newweather/service/callAPI.dart';
import 'package:newweather/utils/colors.dart';
import 'package:newweather/utils/strings.dart';
import 'package:newweather/utils/style.dart';
import 'package:newweather/view/newScreen.dart';
import 'package:newweather/viewModel/check.dart';
class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}
Func func= Func();
// CallingApis callingApis= CallingApis();
Data data= Data();
bool value;
List<WeatherDetails> calling;
MediaQueryy mediaQuery= MediaQueryy();
class _WeatherScreenState extends State<WeatherScreen> {

@override
void initState()
{
  print('inside vvoid');
  // fetchData();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
   mediaQuery.height= MediaQuery.of(context).size.height;
   mediaQuery.width= MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          
          body: Column(
          children: <Widget>[
            Stack(
               children:<Widget>[
                Container(
                child: Center(child: Text('Weather App', style: style,)),
                height: mediaQuery.height*.35,
                width: mediaQuery.width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70),bottomRight:Radius.circular(70)),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: IconButton(icon: Icon(Icons.add_circle, color:blue), 
                onPressed:  (){
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddData()
                          ));
                }
                    ),),
              ]
            ),
            
            Container(
              height: mediaQuery.height*.1,
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text('Date', style: textStyle,),
                                ),
                                Text('Weather Status',style: textStyle,),
                                Icon(Icons.cloud, color: blue),
                                Text('Temperature(in °C)',style: textStyle,),
                              ],
                            ),
            ),
            Container(
             child: FutureBuilder(
                future: data.getWeatherData(),
                builder: (context, snapshot)
                {
                  if(snapshot.hasData)
                  {
                    print('length of data is ${snapshot.data.length}');
                    calling=snapshot.data;
                    return Container(
                      width: mediaQuery.width,
                      height: mediaQuery.height*.5,
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.all(20),
                        itemCount: calling.length,
                        itemBuilder: (context, index){
                           String status=snapshot.data[index].weatherDetails;
                          conditionChcek(status, func);
                          print(func.iconValue);
                           WeatherDetails details= calling[index];
                          //  print(calling[index])
                          print('item count is ${calling.length}');
                          return SizedBox(
                            height: mediaQuery.height*.1,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('${snapshot.data[index].date}', style: blacktextStyle),
                                Text('${details.weatherDetails}', style: blacktextStyle),
                                Icon(func.iconValue?Icons.cloud_circle : Icons.cloud, color: func.iconValue? blue: blue), 
                                Text('${snapshot.data[index].minTemperature}°C - ${snapshot.data[index].maxTemperature}°C', style: blacktextStyle),
                              ],
                            ),
                          );
                        }
                      ),
                    );
                  }
                  else{
                   return Center(child: CircularProgressIndicator());
                  }
                }
                ),
            ),
          ],
        ),
      ),
    );
  }

}
  
