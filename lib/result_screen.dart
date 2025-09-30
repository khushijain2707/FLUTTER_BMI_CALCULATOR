import 'package:bmi_calcuator/color_plates.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int bmiResult;
  final String gender;
  const ResultScreen({super.key, required this.bmiResult,required this.gender});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var bmiColor = Colors.white;
  var bmiText = 'Normal';
  var imagepath = 'normal';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  void updateUI(){
    var bmi = widget.bmiResult;
    if(bmi<18){
         bmiColor = Colors.lightBlueAccent;
         bmiText = 'Underweight';
         imagepath = 'under';
    } 
   else if(bmi>=18 && bmi<=25){
         bmiColor = Colors.green;
         bmiText = 'Normal';
         imagepath = 'normal';
    } 

    else if(bmi > 26 && bmi<=30){
         bmiColor = Colors.yellow;
         bmiText = 'Overweight';
         imagepath = 'over';
    } 

    else if(bmi > 31 && bmi<=35){
         bmiColor = Colors.orange;
         bmiText = 'Obesity';
         imagepath = 'obesity';
    } 

    else if(bmi >= 36){
         bmiColor = Colors.red;
         bmiText = 'ExtremeObesity';
         imagepath = 'exobesity';
    } 
  }
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Screen",
        style: TextStyle(color: Colors.white,fontSize: 25)),
        centerTitle: true,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(
        color: Colors.white, // back arrow color white
        ),
      ),
      backgroundColor: darkBlueColor,
      body: Column(
        children: [
          Container(
           width: width,
           height: 200,
           decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
           ),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your BMI value is",
                style: TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ) ,
                ),
              ),
              Text("${widget.bmiResult}",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                color: Colors.white
              ),
              ),
              Text(
                '${bmiText}',
               style: TextStyle(
                  fontSize: 35, 
                  fontWeight: FontWeight.bold,
                  color: bmiColor,
                ) 
              ),
              Text(
                "Gender : ${widget.gender}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              )
            ],
           ),
          ),
          Image.asset("assets/images/${imagepath}.png",
          height: 380,
          width: 380,
          ),
           GestureDetector(
          onTap: (){
             Navigator.pop(context);
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Calculate Again",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
              ),
            ),
          ),
        )
        ],
      ),
    );
  }
}