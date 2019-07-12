import 'package:flutter/material.dart'; 
import '../pages/tabs.dart';
import '../pages/search.dart';

final routes = {
  "/": (context) => TabsPage(),
  "/search": (context) => SearchPage(),

  };

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context,arguments:settings.arguments),
          
        );
        return route;
    } else {
        final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context), 
        );
        return route;
    }
  }
};
