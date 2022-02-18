// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';

class FormFieldComp extends StatelessWidget {

  FormFieldComp({this.maxLines, this.hintText,this.prefix, this.controller, this.suffix,this.textInput});
  
  final TextEditingController? controller;
  final String? hintText;
  final InkWell? suffix;
   final Icon? prefix;
  final int? maxLines;
  final TextInputType? textInput;
  // final String validate; 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: vwhite,
          borderRadius: BorderRadius.circular(30.0)
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        cursorColor: vred,
        keyboardType: textInput,
         validator: (value ){},
        // ignore: prefer_const_constructors
        style: TextStyle(
          color:vred,  ),
          controller: controller,
          decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 21),
          hintText: hintText,
           hintStyle: TextStyle(
             color: vred
           ),
         
          prefix: prefix,
          suffixIcon: suffix,
        ),
        maxLines: maxLines,
      ),
    );
  }
}

