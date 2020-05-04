import 'package:http/http.dart' as http;
import 'package:newweather/model/weatherDetails.dart';
import 'package:newweather/utils/strings.dart';
import 'package:newweather/viewModel/callingApi.dart';
List<WeatherDetails> list;

Future<List<WeatherDetails>> fetchData() async {

    print('hello');
    final response =
        await http.get(url);
      print('response is ${response.body}');
     
return converting(response);
  }
  