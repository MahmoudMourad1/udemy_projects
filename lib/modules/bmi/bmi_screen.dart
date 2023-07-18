import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled1/modules/bmi_result/bmi_result_screen.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  bool ismale=true;
  double height = 120.0;
  int weight=80;
  int age=18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text(
          'BMI CALCULATOR'
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          ismale=true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(image: AssetImage('images/male.png'),
                           height: 90.0,
                           width: 90.0,),
                            Text('MALE',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,

                            ),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: ismale ? Colors.blue: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                   width: 10.0,
                  ),
                  Expanded(

                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          ismale=false;
                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(image: AssetImage('images/famale.png'),
                           height: 90.0,
                           width: 90.0,),
                            Text('FEMALE',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,

                              ),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: !ismale ? Colors.blue: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('HEIGHT',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900

                        ),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                          Text('${height.round()}',style:TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                          ),
                          Text('CM',
                            style: TextStyle(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                            ),)
                        ],
                        ),
                        Slider(value:height,
                            max: 220.0,
                            min: 80.0,
                            onChanged: (Value){setState(() {
                              height=Value;

                            });},),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey,

                ),

              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900

                              ),),
                            Text('${weight}',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900

                              ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  onPressed:() {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child:Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed:() {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child:Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            )


                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('AGE',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900

                              ),),
                            Text('${age}',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900

                              ),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  mini: true,
                                  onPressed:() {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  child:Icon(
                                    Icons.remove,
                                  ),
                                ),
                                FloatingActionButton(
                                  mini: true,
                                  onPressed:() {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child:Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            )


                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey,
                        ),
                      ),
                    ),

                  ],
                ),


              ),
            ),
          ),
          Container(
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              child: MaterialButton(onPressed: (){
                var result = weight / pow(height/100 ,2 );
                print(result.round());
                Navigator.push(context,MaterialPageRoute(builder:(context)=> BMIResultScreen(
                  age: age,
                  isMale: ismale,
                  result: result.round(),
                ) ,
                ),);

              },
                height: 50.0,
                child: Text('CALCULATE',style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),
          )

         
        ],
      ),
    );
  }
}
