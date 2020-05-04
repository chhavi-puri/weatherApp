class WeatherDetails
{
  int id;
  String minTemperature;
  String maxTemperature;
  String weatherDetails;
  String date;
 WeatherDetails({ this.minTemperature, this.maxTemperature, this.weatherDetails, this.date, this.id} );
 factory WeatherDetails.fromJson(Map<String, dynamic> json)=>WeatherDetails( 
    minTemperature:json['min_temp'].toString(),
     maxTemperature: json ['max_temp'].toString(),
     weatherDetails:json['weather_state_name'],
     date: json['applicable_date'].toString(),);
 Map<String, dynamic> toJson()=>{
   'minTemperature':minTemperature,
   'maxTemperature':maxTemperature,
   'weatherDetails':weatherDetails,
   'date': date,
 };
}










