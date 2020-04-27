import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  final String name;
  UndefinedView({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No path for ${this.name}'),
      ),
    );
  }
}
