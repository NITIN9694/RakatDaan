import 'package:flutter/material.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';

class LoginForm extends StatelessWidget {
    LoginForm({this.controller, this.textInput,isobscureText,this.hintext});
  
  final TextEditingController? controller;
   final bool isobscureText=true ;
   final String? hintext;
  final TextInputType? textInput;
  @override
  Widget build(BuildContext context) {
    return Container(
             decoration: BoxDecoration(
             color: vwhite,
             borderRadius: BorderRadius.circular(10.0)),
             width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                
             controller: controller,
              obscureText: isobscureText,
             cursorColor: vred,
             keyboardType: textInput,
              validator: (value) {},
               style: TextStyle(
                color: vred,
                ),
               decoration: InputDecoration(
                 focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
               errorBorder: InputBorder.none,
                                     disabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 21),
                                    hintText: hintext,
                                    hintStyle: TextStyle(color: vred),
                                  ),
                                ));
  }
}

class LoginForm2 extends StatelessWidget {
    LoginForm2({this.controller, this.textInput,isobscureText,this.hintext});
  
  final TextEditingController? controller;
   final bool isobscureText=false ;
   final String? hintext;
  final TextInputType? textInput;
  @override
  Widget build(BuildContext context) {
    return Container(
             decoration: BoxDecoration(
             color: vwhite,
             borderRadius: BorderRadius.circular(10.0)),
             width: MediaQuery.of(context).size.width * 0.9,
              child: TextFormField(
                
             controller: controller,
              obscureText: isobscureText,
             cursorColor: vred,
             keyboardType: textInput,
              validator: (value) {},
               style: TextStyle(
                color: vred,
                ),
               decoration: InputDecoration(
                 focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
               errorBorder: InputBorder.none,
                                     disabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 21),
                                    hintText: hintext,
                                    hintStyle: TextStyle(color: vred),
                                  ),
                                ));
  }
}