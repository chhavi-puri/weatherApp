import 'package:flutter/material.dart';
import 'package:newweather/database/data.dart';
import 'package:newweather/model/weatherDetails.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}
final kformKey = GlobalKey<FormState>();
Data databse= Data(); 
class _AddDataState extends State<AddData> {
  TextEditingController controllerMin= TextEditingController();
  TextEditingController controllerMax=TextEditingController();
  TextEditingController controllerStatus=TextEditingController();
  TextEditingController controllerDate=TextEditingController();
  TextEditingController controllerId=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Form(
        key: kformKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(80),
                   ),
                  hintText: 'Enter minimum Temperature',
                ),
                controller: controllerMin,
                validator: (value){
                 return  value.isEmpty? 'Enter valid details': null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(80),
                   ),
                  hintText: 'Enter maximum Temperature',
                ),
                controller: controllerMax,
                validator: (value){
                 return  value.isEmpty? 'Enter valid details': null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(80),
                   ),
                  hintText: 'Enter weather Status',
                ),
                controller: controllerStatus,
                validator: (value){
                 return  value.isEmpty? 'Enter valid details': null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(80),
                   ),
                  hintText: 'Enter applicable date',
                ),
                controller: controllerDate,
                validator: (value){
                 return  value.isEmpty? 'Enter valid details': null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(80),
                   ),
                  hintText: 'Enter ID(only for updation)',
                ),
                controller: controllerId,
                validator: null,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('New Entry'),
                  onPressed: (){
                    if(kformKey.currentState.validate())
                    {
                      WeatherDetails weather =WeatherDetails(
                        minTemperature: controllerMin.text,
                        maxTemperature: controllerMax.text,
                        weatherDetails: controllerStatus.text,
                        date: controllerDate.text,
                      );
                      databse.insertData(weather).then((id)
                      {
                       controllerMin.clear();
                       controllerMax.clear();
                       controllerStatus.clear();
                       controllerDate.clear();

                      });
                    }
                  }),
                  
              RaisedButton(
                  child: Text('Update Entry'),
                  onPressed: (){
                    print('id is ${controllerId.text}');
                    if(kformKey.currentState.validate())
                    {
                      WeatherDetails weatherDa =WeatherDetails(
                        minTemperature: controllerMin.text,
                        maxTemperature: controllerMax.text,
                        weatherDetails: controllerStatus.text,
                        date: controllerDate.text,
                        id: int.parse(controllerId.text),
                    
                      );
                      print('weatger id is ${weatherDa.id}');
                      databse.update(weatherDa).then((id)
                      {
                        print('inside newscrid');
                       controllerMin.clear();
                       controllerMax.clear();
                       controllerStatus.clear();
                       controllerDate.clear();
                       controllerId.clear();
                        
                      });
                    }
                  }),

              ],
            )
          ],
        ),
        )
    );
  }
}