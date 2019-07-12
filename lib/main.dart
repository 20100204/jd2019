import 'package:flutter/material.dart'; 
 import './pages/tabs.dart';
import './routers/router.dart';
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
       //home:TabsPage() ,
       initialRoute: "/",
       onGenerateRoute:onGenerateRoute,
     );
   }
 }
   