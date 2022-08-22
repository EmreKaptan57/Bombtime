import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';

void main() {
  runApp(const NOPage());
}

class NOPage extends StatelessWidget {
  const NOPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _sayi = 0;

  void _sayiArttir() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    });
  }

  void geriDon() {
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
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Nasıl Oynanır ?",
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '4 haneli sifreyi bul ve bombayı çöz!',
                style: GoogleFonts.acme(
                    fontSize: 25,
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
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _sayiArttir,
      //   tooltip: 'Geri Dön',
      //   child: const Icon(Icons.arrow_back),
      //   backgroundColor: Colors.red,
      // ),
    );
  }
}
