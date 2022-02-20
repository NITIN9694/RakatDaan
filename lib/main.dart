// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakatdaan/Screens/Authentication/Registration.dart';
import 'package:rakatdaan/Screens/Authentication/Signin.dart';

import 'package:rakatdaan/Screens/Authentication/OtpScreeb.dart';
import 'package:rakatdaan/Screens/HomeScreen.dart';

void main() {
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

      home:SignIn(),
      routes: {
        /*Authentication*/
        Registration.id:(context)=>Registration(),
        SignIn.id:(context)=>SignIn(),
        Otpscreen.id:(context)=>Otpscreen(),
        /*HomeScreen*/
        Homescreen.id:(context)=>Homescreen()
      },
    );
  }
}

