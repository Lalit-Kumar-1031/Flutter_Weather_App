import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Utils {
  Size getScreenSize() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }

  ShowSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.black.withOpacity(0.7),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          duration: Duration(seconds: 1),
          behavior: SnackBarBehavior.floating,
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(content),
              ],
            ),
          )),
    );
  }

  ErrorSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.red.shade600,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          content: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(content),
              ],
            ),
          )),
    );
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300 :
        return Image.asset(
            'assets/Images/1.png'
        );
      case >= 300 && < 400 :
        return Image.asset(
            'assets/Images/2.png'
        );
      case >= 500 && < 600 :
        return Image.asset(
            'assets/Images/3.png'
        );
      case >= 600 && < 700 :
        return Image.asset(
            'assets/Images/4.png'
        );
      case >= 700 && < 800 :
        return Image.asset(
            'assets/Images/5.png'
        );
      case == 800 :
        return Image.asset(
            'assets/Images/6.png'
        );
      case > 800 && <= 804 :
        return Image.asset(
            'asset/Imagess/7.png'
        );
      default:
        return Image.asset(
            'assets/Images/7.png'
        );
    }
  }
}