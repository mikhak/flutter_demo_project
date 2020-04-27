import 'dart:ui';

import 'package:flutter/material.dart';
import '../model/food.dart';
import '../model/menu.dart';

class DetailsView extends StatelessWidget {
  final String id;
  DetailsView({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Food food = Menu.getFoodById(id);
    return new Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text("Details View"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 360,
              height: 500,
              child: Card(
                margin: EdgeInsets.all(10.0),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: AssetImage(food.image),
                        //NetworkImage(
                        //    "https://s3-us-west-2.amazonaws.com/com.sqirlla.images/DIS_Buckwheat.jpg"),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.topCenter, // Alignment.bottomCenter,
                  // padding: EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    // make sure we apply clip it properly
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        color: Color(0x254CAF50),
                        // color: Color.fromRGBO(0, 255, 0, 0.19),
                        child: Container(
                          // height: 200,
                          child: Card(
                            color: Color(0xAA4CAF50),
                            margin: EdgeInsets.all(10.0),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        food.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            .copyWith(
                                                fontSize: 20,
                                                color: Colors.green[900]),
                                      ),
                                      Text(food.price,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[200],
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      16.0, 16.0, 16.0, 24.0),
                                  child: Text(food.description,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                        fontSize: 16,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 360,
              height: 200,
              child: Card(
                margin: EdgeInsets.all(10.0),
                color: Color(0xAA4CAF50),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                    child: Text(food.reviews[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
