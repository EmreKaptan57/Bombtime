import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game.dart';
import 'nasil_oynanir.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int zaman = 59;
  int randomNumber1 = 0;
  Random random = Random();
  var min = 1000;
  var max = 9999;

  rastgeleSayilar() {
    randomNumber1 = min + random.nextInt(max - min);
    return randomNumber1;
  }

  @override
  void initState() {
    rastgeleSayilar();
    super.initState();
  }

  void geriGel() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Piton Games",
          style: GoogleFonts.acme(color: Colors.white),
        ),

      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/bombWal.png',
          ),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'BOMB TIME!',
                style: GoogleFonts.acme(
                    fontSize: 60,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(
                          0,
                          0,
                        ),
                        blurRadius: 30,
                        color: Colors.black,
                      ),
                    ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(170, 70),
                    shadowColor: Colors.black,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    primary: Colors.black),
                onPressed: () {
                  rastgeleSayilar();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GamePage(
                              randoms: randomNumber1.toString(),
                            )),
                  );
                },
                icon: const Icon(Icons.play_arrow, size: 50),
                label: Text(
                  'BAŞLAT',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(140, 60),
                    shadowColor: Colors.black,
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    primary: Colors.black),
                onPressed: () {
                  setState(() {});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NOPage()),
                  );
                },
                icon: const Icon(Icons.quiz_sharp, size: 40),
                label: Text(
                  'Nasıl Oynanır ?',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
