// ignore_for_file: prefer_is_empty, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';

class OTPInput extends StatefulWidget {

  OTPInput({ this.controller,this.last,  this.first});

  final TextEditingController ? controller;



  final bool? first;
  final bool ?last;

  @override
  State<OTPInput> createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return Form(child: Row(
    children: [
      SizedBox(
        width: size.width*0.09,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: vwhite,
             
          ),
          child: TextFormField(
         obscureText: true,
         keyboardType: TextInputType.phone,
         controller: widget.controller,
         cursorColor: vred,
         decoration:  InputDecoration(
         filled: true,
         enabledBorder: InputBorder.none,
         errorBorder: InputBorder.none,
         disabledBorder: InputBorder.none,
         border: InputBorder.none,
         ), 
         style: TextStyle(
         color: vred,
         fontSize: 21, ),
         onChanged: (value){
         if(value.length == 1 && widget.last == false){
            FocusScope.of(context).nextFocus();
          }
          if(value.length == 0 &&  widget.first == false){
            FocusScope.of(context).previousFocus();
          }
        },
          ),
        ),
      )
    ],
    ));
  }
}