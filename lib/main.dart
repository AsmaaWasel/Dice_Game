import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> list = [
    "images/1.png",
    "images/2.png",
    "images/3.png",
    "images/4.png",
    "images/5.png",
    "images/6.png",
  ];

  String image1 = "images/4.png";
  String image2 = "images/6.png";
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("The Dice App",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: Colors.black,
          actions: [
            InkWell(
              onTap: (){
                setState(() {
                  Random random1 = Random();
                  int randomNum1 = random1.nextInt(list.length);
                  image1 = list[randomNum1];
                });
              },
              child: const Text(
              'Roll One Dice',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Shake to throw",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                      image1,
                      color: Colors.red),
                  Image.asset(
                    image2,
                    color: Colors.red,
                  ),
                ],
              ),
              Text('Score : $counter',
                style:TextStyle(
                    color: Colors.green),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Random random1 = Random();
                      Random random2 = Random();
                      int randomNum1 = random1.nextInt(list.length);
                      int randomNum2 = random2.nextInt(list.length);
                      image1 = list[randomNum1];
                      image2 = list[randomNum2];
                      if(image1 == image2)
                        {
                          counter++;
                        }
                    });
                  },
                  child: const Text(
                    "Roll Dice",
                    style: TextStyle(
                        color: Colors.red),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
