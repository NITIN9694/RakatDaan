// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';

class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);
  static String id= "sign_in";
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
 
  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child:Stack(
            children: [
             Image.asset("images/icon.png",height:size.height*0.3,width: size.width,),
             Padding(padding: EdgeInsets.only(top: size.height*0.3,left: size.width*0.09,right: size.width*0.09),
             child: Container(
              decoration: BoxDecoration(
                color: vred,
                boxShadow: [],
                borderRadius: BorderRadius.circular(20)
              ),
               height: size.height*0.5,
               width: size.width*0.98,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   Padding(
                     padding:  EdgeInsets.all(8.0),
                     child: Container(
      decoration: BoxDecoration(
        color: vwhite,
          borderRadius: BorderRadius.circular(10.0)
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        cursorColor: vred,
        keyboardType: TextInputType.phone,
         validator: (value ){},
        // ignore: prefer_const_constructors
        style: TextStyle(
          color:vred,  ),
          // controller: controller,
          decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 21),
          hintText: "Enter Number",
           hintStyle: TextStyle(
             color: vred
               ),), ), ),
                   ),
                   SizedBox(
                     height: size.height*0.05,
                   ),
                   Container(
                     height: size.height*0.07,
                     width: size.width*0.4,
                     decoration: BoxDecoration(
                     color: vwhite,
                     borderRadius: BorderRadius.circular(20)
                     ),
                     child: Center(
                       child: Text("Send OTP",style:TextStyle(
                          color: vred,
                          fontWeight: FontWeight.bold
                       ) ,),
                     ),
                   )
                  ],
                ),
              ),
             ),
            ]
            ) ,
        ),
      ),
    );
  }
}