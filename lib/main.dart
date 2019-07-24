import 'package:flutter/material.dart';
import 'package:itjd/routes/router.dart' as prefix0;
import './pages/tabs/Tab.dart';
import './routes/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Tabs(),
      initialRoute: '/',
      onGenerateRoute: prefix0.onGenerateRoute,
    );
  }
}
