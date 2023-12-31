import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/Screens/Home_Screen.dart';
import 'package:flutter_weather_app/Utils/SnackBar_MediaQuery.dart';
import 'package:flutter_weather_app/Widgets/Home_background_widget.dart';
import 'package:geolocator/geolocator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void getLocation()async{
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    print("------------A_____________");

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);


  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: Utils().getScreenSize().width,
                    height: Utils().getScreenSize().height * 0.15,
                  ),
                  Image.asset(
                    'assets/Images/weather.png',
                    scale: 4,
                  ),
                  SizedBox(
                    width: Utils().getScreenSize().width,
                    height: 20,
                  ),
                  Center(
                      child: Divider(
                    height: 2,
                    color: Colors.white,
                    indent: 40,
                    endIndent: 40,
                    thickness: 3,
                  )),
                  SizedBox(
                    width: Utils().getScreenSize().width,
                    height: 30,
                  ),
                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.all(17),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: InkWell(
                            onTap: getLocation,
                            child: Text(
                              "Weather App",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                          )),
                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      Text(
                        "Your Device Location is Disable",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: 30,
                        width: 200,
                        child: ElevatedButton(onPressed: getLocation, child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Enable Location",style: TextStyle(
                                color: Colors.purpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),),
                            Icon(Icons.start,color: Colors.purpleAccent,)
                          ],
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
