import 'package:flutter/material.dart';
import '../model/menu.dart';
import '../model/food.dart';
import '../consts/route_paths.dart';

/*
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'DGMD E-11 Demo App',
    theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.accent,
          minWidth: 50,
        )),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(title: 'Login Page'),
      '/menu': (context) => MyHomePage(title: 'Menu Viewer'),
      '/details': (context) => DetailsPage("10"), // SecondRoute(),
    },
  ));
}
*/

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _counter = _counter % 10;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) {
        _counter = 10 + (_counter % 10);
      }
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    int id = (_counter + 1);
    String foodId = id.toString();
    final Food food = Menu.getFoodById(foodId);
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Menu View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: 440,
              // height: 440,
              child: Card(
                margin: EdgeInsets.all(10.0),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, DetailsRoute,
                              arguments: foodId);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Container(
                            // color: Colors.pink,
                            child: FittedBox(
                              child: Image(
                                image: AssetImage(food.image),
                                // width: 320.0,
                                // height: 320.0,
                                // Text(
                                //  '$_counter',
                                //  style: Theme.of(context).textTheme.headline4,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(food.name,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 5,
                              color: Colors.lightGreen[900],
                              fontSize: MediaQuery.of(context).size.width / 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(children: <Widget>[
        Positioned(
          bottom: 20.0,
          left: MediaQuery.of(context).size.width * .25,
          child: FloatingActionButton(
            heroTag: 'increase',
            onPressed: () {
              _decrementCounter();
            },
            child: Icon(Icons.arrow_left),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: MediaQuery.of(context).size.width * .25 - 30,
          child: FloatingActionButton(
            heroTag: 'decrease',
            onPressed: () {
              _incrementCounter();
            },
            child: Icon(Icons.arrow_right),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ]),
    );
  }
}
