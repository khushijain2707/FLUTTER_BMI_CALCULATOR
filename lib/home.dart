import 'package:bmi_calcuator/color_plates.dart';
import 'package:bmi_calcuator/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int heightSlider = 120;
  int age = 25;
  int weight = 40;

  Color maleColor = Color(0xff033e66);
  Color femaleColor = Color(0xff033e66);

  String selectedGender = "";  

  void calculateBMI(){
    double h = heightSlider /100;
    double bmi = weight/(h * h);
     
   Navigator.push(
    context, MaterialPageRoute(
      builder: (context) => ResultScreen(
        bmiResult: bmi.round(),
         gender: selectedGender,
        )));
  //   var heightInMetter = heightSlider/100;
  //   var bmi = weight/ (heightInMetter * heightInMetter);
  }

  void selectGender(bool gender){
     if(gender){
        setState(() {
          maleColor = blueColor;
          femaleColor = selectedColor;
          selectedGender = "Male"; 
        });
     }
     else{
      setState(() {
        femaleColor = blueColor;
         maleColor = selectedColor;
         selectedGender = "Female";
      });
     }
  }

  addSubAge(bool Ageadd){
    if(Ageadd) {
      setState(() {
       age++;        
      });
    }else{
      setState(() {
       age--;
      });
    }
  }

  addSubWeight(bool Weightadd){
    if(Weightadd) {
      setState(() {
       weight++;        
      });
    }else{
      setState(() {
        weight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
          color: Colors.white,
        fontSize: 25,
        ),),
        centerTitle: true,
        backgroundColor: backgroundColor,
        // backgroundColor: Color(0xFF131145),
      ),
      backgroundColor: darkBlueColor,
      // backgroundColor: Color(0xFF0D0D2A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        print("Male Clicked");
                        selectGender(true);
                      });
                      },
                    child: ResubleCard(
                      Colour: maleColor,
                       cardChild: Column(
                         children: [
                          Image.asset("assets/images/Male.png",
                          height: 140,
                          width: 140,
                      ),
                      Text("Male",
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        ),)
                       ],
                       ),
                    ),
                  ),
        ),
        Expanded(
          child:  GestureDetector(
            onTap: (){
              setState(() {
                print("Female Clicked");
                 selectGender(false);
              });
            },
            child: ResubleCard(
              Colour: femaleColor,
               cardChild: Column(
                children: [
                  Image.asset("assets/images/Female.png",
                  height: 140,
                  width: 140,
                  ),
                  Text("Female",
                  style: TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                  )
                ],
               ),
            ),
          ),
          )
           ],
            )
            ),
           Expanded(
            child: ResubleCard(
              Colour: blueColor,
             cardChild: Column(
              children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Height",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Text(
                    "${heightSlider}",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "cm",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                      ),
                    )
                  ],
                ),
                Slider(
                  min: 120,
                  max: 200,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  thumbColor: Colors.pink,
                  value: heightSlider.toDouble(),
                   onChanged: (double value) {
                  setState(() {
                     heightSlider = value.toInt();
                  });
                })
              ],
             ),
             ),
            ),
            Expanded(
              child: Row(
              children: [
                Expanded(
                  child: ResubleCard(
                    Colour: blueColor, 
                    cardChild: Column(
                      children: [
                        Text(
                          "Age",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                        Text(
                          "${age}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.white,
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                heroTag: null,
                                child: Icon(
                                  Icons.add,
                                size: 30,
                                // color: Colors.white,
                                ),
                                backgroundColor: Colors.grey,
                                splashColor: Colors.pink,
                                hoverColor: Colors.blue,
                                shape: CircleBorder(),
                                  onPressed: (){
                                    setState(() {
                                      addSubAge(true);
                                    });
                                  },
                                  ),
                            ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton(
                                  heroTag: null,
                                  child: Icon(
                                    Icons.remove,
                                    size: 30,),
                                  backgroundColor: Colors.grey,
                                   splashColor: Colors.pink,
                                hoverColor: Colors.blue,
                                shape: CircleBorder(),
                                  onPressed: (){
                                    setState(() {
                                      addSubAge(false);
                                    });
                                  },
                                  ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
        ),
        Expanded(
          child:  ResubleCard(
            Colour : blueColor,
             cardChild: Column(
                      children: [
                        Text(
                          "Weight",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),
                        Text(
                          "${weight}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.white,
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FloatingActionButton(
                                heroTag: null,
                                child: Icon(
                                  Icons.add,
                                size: 30,
                                // color: Colors.white,
                                ),
                                backgroundColor: Colors.grey,
                                splashColor: Colors.pink,
                                hoverColor: Colors.blue,
                                shape: CircleBorder(),
                                  onPressed: (){
                                    setState(() {
                                      addSubWeight(true);
                                    });
                                  },
                                  ),
                            ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FloatingActionButton(
                                  heroTag: null,
                                  child: Icon(
                                    Icons.remove,
                                    size: 30,),
                                  backgroundColor: Colors.grey,
                                   splashColor: Colors.pink,
                                hoverColor: Colors.blue,
                                shape: CircleBorder(),
                                  onPressed: (){
                                    setState(() {
                                      addSubWeight(false);
                                    });
                                  },
                                  ),
                              ),
                          ],
                        )
                      ],
                    ),
          ),
        ),
          ],
        ),
        ),
        GestureDetector(
          onTap: (){
            calculateBMI();
          },
          child: Container(
            height: 55,
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Calculate BMI",
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
      ),
    );
  }
}

class ResubleCard extends StatelessWidget {
   ResubleCard({ //ek colour nu constroctor banayu je resublecard ma color aapi sakay
    super.key, required this.Colour, required this.cardChild,
  });

  Color Colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
                  margin: EdgeInsets.all(10), //margin thi box ni bahar side chare baju space aaijase 
                  decoration: BoxDecoration(
                  color: Colour,
                  borderRadius: BorderRadius.circular(10)
            ),
          );
  }
}


