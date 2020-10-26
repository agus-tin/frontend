import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/splash.dart';

void mainIntroPages() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'images/top.svg',
              width: 400,
              height: 40,
            ),
            Text("Coaching App",
                style: GoogleFonts.pacifico(
                    fontWeight: FontWeight.bold, fontSize: 50, color: Colors.blue)),
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
            Divider(),
            SizedBox(height: 100),
            Column(
              children: [
                Container(
                  color: Colors.orange,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.home),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.circle),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FirstRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ThirdRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FourthRoute()),
                            );
                          },
                        ),
                      ]
                  ),
                ),
              ],
            ),
            Image.asset('images/stklogo.png'),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body:     Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            Container(
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color:Colors.green
              ),
              child: Text("GeeksForGeeks",style: TextStyle(color:Colors.white,fontSize:25),),
            ),
            Center(
              child: ElevatedButton(
                child: Text('Open route'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.orange,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.home),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FirstRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.circle),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ThirdRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FourthRoute()),
                            );
                          },
                        ),
                      ]
                  ),
                ),
              ],
            ),
            Image.asset('images/stklogo.png'),
          ]
      ),
    );
  }
}


class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("third Route"),
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            Container(
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color:Colors.green
              ),
              child: Text("GeeksForGeeks",style: TextStyle(color:Colors.white,fontSize:25),),
            ),
            Center(
              child: ElevatedButton(
                child: Text('Open route'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.orange,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.home),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FirstRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.circle),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ThirdRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FourthRoute()),
                            );
                          },
                        ),
                      ]
                  ),
                ),
              ],
            ),
            Image.asset('images/stklogo.png'),
          ]
      ),
    );
  }
}

class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Route"),
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            Container(
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  color:Colors.green
              ),
              child: Text("GeeksForGeeks",style: TextStyle(color:Colors.white,fontSize:25),),
            ),
            Center(
              child: ElevatedButton(
                child: Text('Open route'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.orange,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.home),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Splash()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FirstRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.adjust),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ThirdRoute()),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.circle),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FourthRoute()),
                            );
                          },
                        ),
                      ]
                  ),
                ),
              ],
            ),
            Image.asset('images/stklogo.png'),
          ]
      ),
    );
  }
}