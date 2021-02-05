import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConfettiController _controllerCenter;
  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 4));
    super.initState();
  }
  void dispose() {
    _controllerCenter.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Container(
              height: 70,
              width: 450,
              child: Center(
                child: Text(
                  " Enjoying #30daysofFlutter ?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "Playball"),
                ),
              ),
            ),
          ),
          // SizedBox(height: 20,),
          FadeInImage.memoryNetwork(
            alignment: Alignment.center,
            placeholder: kTransparentImage,
            height: 400,
            width: 450,
            fit: BoxFit.cover,
            fadeOutCurve: Curves.easeInOut,
            fadeInDuration: Duration(seconds: 1),
            fadeOutDuration: Duration(seconds: 2),
            image:
                'https://image.freepik.com/free-photo/excited-surprised-beautiful-young-woman-pointing-copyspace_171337-11415.jpg',
          ),
          SizedBox(
            height: 40,
          ),
          ConfettiWidget(
            confettiController: _controllerCenter,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            blastDirection: -pi / 2,
            emissionFrequency: 0.01,
            numberOfParticles: 30,
            maxBlastForce: 100,
            minBlastForce: 80,
            //gravity: 0.3,

            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.black,
              Colors.purple,
              Colors.red,
              Colors.white,
            ],
          ),

          Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12),
              child: TextButton(
                  onPressed:  () {
                    _controllerCenter.play();
                  },
                  child: Text(
                    "Yes! Of Course!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    ));
  }
}
