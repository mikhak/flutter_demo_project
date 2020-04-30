import 'package:flutter/material.dart';

import 'locator.dart';
import 'router.dart' as router;
import 'consts/route_paths.dart' as routes;
import 'services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DGMD E-11 Demo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.greenAccent,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.accent,
          minWidth: 50,
        ),
        fontFamily: 'Raleway',
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: routes.LoginRoute,
    );
  }
}
