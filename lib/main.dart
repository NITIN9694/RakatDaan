// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakatdaan/Screens/Authentication/Registration.dart';
import 'package:rakatdaan/Screens/Authentication/Signin.dart';

import 'package:rakatdaan/Screens/Authentication/Singup.dart';
import 'package:rakatdaan/Screens/HomeScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RakatDaan',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily
       ),

      home:Signup(),
      routes: {
        /*Authentication*/
        Registration.id:(context)=>Registration(),
        SignIn.id:(context)=>SignIn(),
        Signup.id:(context)=>Signup(),
        /*HomeScreen*/
        Homescreen.id:(context)=>Homescreen()
      },
    );
  }
}

