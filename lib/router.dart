import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'consts/route_paths.dart' as routes;
import 'views/details.dart';
import 'views/menu.dart';
import 'views/login.dart';
import 'views/undefined.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginView());
    case routes.MenuRoute:
      return MaterialPageRoute(builder: (context) => MenuView());
    case routes.DetailsRoute:
      var foodId = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => DetailsView(id: foodId));
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name));
  }
}
