import 'package:bmi_calcuator/color_plates.dart';
import 'package:bmi_calcuator/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirect();
  }
  redirect() async{
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlueColor,
      body: Center(
        child: Image.asset(
          "assets/images/BMI.png",
        height: 200,
        width: 200,
        ),
      ),
    );
  }
}