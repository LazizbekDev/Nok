import 'package:flutter/material.dart';
import 'package:nok/routes/route_names.dart';
import 'package:nok/screens/home.dart';
import 'package:nok/screens/login.dart';
import 'package:nok/screens/register.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.home:
      return MaterialPageRoute(builder: (_) => const Home());

    case RouteNames.signIn:
      return MaterialPageRoute(builder: (_) => Login());

    case RouteNames.signUp:
      return MaterialPageRoute(
        builder: (_) => Register(),
      );

    default:
      return MaterialPageRoute(builder: (_) => const Home());
  }
}
