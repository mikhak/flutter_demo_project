import 'package:flutter/material.dart';

class PlaygroundView extends StatelessWidget {
  PlaygroundView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          // Max Size
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
            height: 300.0,
            width: 300.0,
          ),
          Container(
            color: Colors.pink,
            height: 150.0,
            width: 150.0,
          )
        ],
      ),
      floatingActionButton: Positioned(
        top: MediaQuery.of(context).size.height / 2,
        left: 50,
        child: FloatingActionButton(
          heroTag: 'increase',
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.home),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
