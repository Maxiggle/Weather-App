
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';



class LoadingScreen extends StatefulWidget {
  
  
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

 // List<Country>  country = [];
 var countryValue = '';
 var stateValue = '';
 var cityValue='';
 var address = '';

 


 
   @override
  void initState() {
   super.initState();
  
 
  }
  void fetchWeatherData()async{
   //api to request for weather data using country id
      Response response = await get(Uri.https("api.openweathermap.org","data/2.5/weather",
      {"q":"$countryValue","appid":"bf451b4c3a18356c5b1e065e0774edd9"}));
      if(response.statusCode == 200){
        String data = response.body;
        print(data);
      } else{
        print(response.statusCode);
      }
      
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 300,
            child: Column(
              children: [
                ///Adding CSC Picker Widget in app
                CSCPicker(
                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: true,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: true,

                  ///Enable (get flat with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey.shade300,
                      border:
                          Border.all(color: Colors.grey.shade300, width: 1)),

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (value) {
                   
                    setState(() {
                       ///store value in country variable
                      countryValue = value;
                       fetchWeatherData();
                       
                    });
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {
                    setState(() {
                      ///store value in state variable
                      stateValue = value;
                    });
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {
                     
                    setState(() {
                      
                      ///store value in city variable
                      cityValue = value;
                      
                     
                    });
                  },
                ),

                ///print newly selected country state and city in Text Widget
                TextButton(
                    onPressed: () {
                      setState(() {
                        address = "$cityValue,$countryValue, $stateValue";
                      });
                    },
                    child: Text("Print Data")),
                Text(address)
              ],
            )),
      ),
    );
  }
}

 
