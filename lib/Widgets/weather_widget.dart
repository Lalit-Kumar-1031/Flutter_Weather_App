import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final String backgroundImage;
  final String IconImage;
  final String Time_or_Temprature;
  final VoidCallback callback;


  WeatherWidget({Key? key, required this.backgroundImage, required this.IconImage, required this.Time_or_Temprature, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: callback,
        child: Container(
          height: MediaQuery.of(context).size.height*0.2,
          width:MediaQuery.of(context).size.width*0.8,
          decoration: BoxDecoration(color:Colors.white,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(backgroundImage,),fit: BoxFit.fill,
            ),
            border: Border.all(color: Colors.white,width: 2),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height*0.2,
            width:MediaQuery.of(context).size.width*0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Image.asset(IconImage,scale: 7,),
                Text(Time_or_Temprature,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
