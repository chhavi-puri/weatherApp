// import 'package:weather_app/model/weatherDetails.dart';


import 'package:newweather/model/boolFunc.dart';

conditionChcek(weatherDetails, Func func)
{
  if(weatherDetails=="Light Rain")
  {
    func.iconValue=true;
  }
  else
  {
    func.iconValue=false;
  }
}