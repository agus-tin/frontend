import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'intro/intro_pages.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset(
            'images/top.svg',
            width: 400,
            height: 40,
          ),
      Text("Coaching App",
          style: GoogleFonts.pacifico(
              fontWeight: FontWeight.bold, fontSize: 50, color: Colors.blue)),
          SizedBox(height: 50),
          InkWell(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                  )),
              child: Icon(Icons.add, color: Colors.black),
            ),
            onTap: () {},
          ),
          SizedBox(height: 50),
          InkWell(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: new BorderRadius.circular(10.0),
                  border: Border.all(
                    width: 1,
                  )),
              child: Icon(Icons.person, color: Colors.black),
            ),
            onTap: () {},
          ),
          Divider(),
          SizedBox(height: 100),
          Image.asset('images/stklogo.png'),
          Row(children: <Widget>[
             Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstRoute()),
                    );
                  },
                  child: Text('Intro'),
                ),
              )
          ]
            ),
        ],
      ),
    );
  }
}
