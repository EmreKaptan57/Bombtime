import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class GamePage extends StatelessWidget {
  GamePage({Key? key, this.randoms}) : super(key: key);
  String? randoms;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '', random: randoms),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title, this.random}) : super(key: key);

  String? title;
  String? random;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisible = true;
  bool areVisible = false;
  int zaman = 59; //59 olması lazım
  int randomNumber1 = 0;
  Random randoma = Random();
  var min = 1; //1000 olması lazım
  var max = 5; //9999 olması lazım

  rastgeleSayilar() {
    randomNumber1 = min + randoma.nextInt(max - min);
    return randomNumber1;
  }

  @override
  void initState() {
    _geriSayim();
    randoms = widget.random;
    super.initState();
  }

  /*void reset(){
    
  }

  void stopTimer({ bool resets = true}){
   if (resets){
    reset();
   }
   setState(() => timer?.cancel());
  }*/

  void geriDon() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    });
  }

  void _geriSayim() {
    setState(() {
      Timer.periodic(Duration(seconds: 1), (timer) {
        if (zaman > 0) {
          setState(() {
            zaman--;
          });
        }
        if (zaman == 0) {
          setState(() {
            text1 = "Cevap : $randoms!";
            text = "Bomba Patladı!";
            isVisible = false;
          });
        }
        if (textController.text == randoms) {
          timer.cancel();
        }
      });
    });
  }

  void change() {
    var c = int.parse(randoms!);
    var d = int.parse(textController.text);
    if (d < c) {
      text = "Daha büyük deger girin";
    } else if (d > c) {
      text = "Daha küçük deger girin";
    } else {
      text = "Tebrikler!";
    }
  }

  String text = "Süre Basladı !";
  String text1 = "";
  String? randoms = "";
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Bomb  Time!",
          style: GoogleFonts.acme(color: Colors.white),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: geriDon,
            );
          },
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                zaman >= 10 ? "00 : $zaman" : "00 : 0$zaman",
                style: GoogleFonts.acme(
                    fontSize: 40,
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
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Text(
                text,
                style: GoogleFonts.acme(
                    fontSize: 40,
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
                height: MediaQuery.of(context).size.height * 0.10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: isVisible,
                    child: Container(
                      width: 180,
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: textController,

                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textAlign: TextAlign.center,
                        style:
                            GoogleFonts.acme(fontSize: 20, color: Colors.black),
                        decoration:
                            InputDecoration(hintText: "Tahmin giriniz...", hintStyle: TextStyle(color: Colors.black)),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(70, 50),
                        shadowColor: Colors.black,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        primary: Colors.black),
                    onPressed: () {
                      setState(() {
                        zaman == 0 ? geriDon() : change();
                        // randoms==textController.text?
                      });
                    },
                    icon: Icon(Icons.swipe_down_rounded, size: 30),
                    label: Text(
                      zaman == 0 ? "Yeni Oyun" : "Gönder",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                text1,
                style: GoogleFonts.acme(
                    color: Colors.white,
                    fontSize: 40,
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
            ],
          ),
        ),
      ),
    );
  }
}
