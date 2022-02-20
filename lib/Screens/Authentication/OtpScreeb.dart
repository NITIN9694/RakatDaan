// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:rakatdaan/Screens/Authentication/Registration.dart';
import 'package:rakatdaan/Screens/HomeScreen.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';
import 'package:rakatdaan/Widget/OtpInput.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({ Key? key }) : super(key: key);
  static String id ="OtpScreen";
  @override
  _OtpscreenState createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  TextEditingController _otpcontroller1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset("images/icon2.png",width: size.width*0.6,height: size.height*0.3,))
       
           ,Padding(padding: EdgeInsets.only(top: size.height*0.3,left: size.width*0.09,right: size.width*0.09),
             child: Container(
              decoration: BoxDecoration(
                color: vred,
                boxShadow: [
                  // ignore: prefer_const_constructors
                  BoxShadow(
                    color: Colors.black45,
                    // ignore: prefer_const_constructors
                    offset:  Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.circular(20)
              ),
               height: size.height*0.5,
               width: size.width*0.98,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Enter OTP",style: TextStyle(color: vwhite,fontWeight: FontWeight.bold),),
                     SizedBox(
                       height: size.height*0.02,
                     ),
                     Row(
                       children: [
                           Expanded(child: Container()),
                         OTPInput(
                              first: true,
                              last: false,
                            ),
                            Expanded(child: Container()),
                        OTPInput(
                          first: false,
                          last: false,
                        ),
                        Expanded(child: Container()),
                        OTPInput(
                          first: false,
                          last: false,
                        ),
                        Expanded(child: Container()),
                        OTPInput(
                          first: false,
                          last: false,
                        ),
                        Expanded(child: Container()),
                        OTPInput(
                          first: false,
                          last: false,
                        ),
                        Expanded(child: Container()),
                        OTPInput(
                          first: false,
                          last: true,
                        ),
                          Expanded(child: Container()),
                       ],
                     ),
                        
                        SizedBox(
                          height: size.height*0.02,
                        ),
                       InkWell(
                         onTap: (){
                           Navigator.pushNamed(context, Registration.id);
                         },
                       child: Container(
                       height: size.height*0.07,
                       width: size.width*0.4,
                       decoration: BoxDecoration(
                       color: vwhite,
                       borderRadius: BorderRadius.circular(20)
                       ),
                       child: Center(
                         child: Text("SUBMIT",style:TextStyle(
                            color: vred,
                            fontWeight: FontWeight.bold
                         ) ,),
                       ),
                                        ),
                     )
                  ],
                ),
              ),
             ),
        ],
      ),
    );
  }
}