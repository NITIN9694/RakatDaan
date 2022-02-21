// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rakatdaan/Classes/Authclass.dart';
import 'package:rakatdaan/Screens/Authentication/Registration.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';
import 'package:rakatdaan/Widget/Loginform.dart';

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);
  static String id ="OtpScreen";
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GoogleSignIn _googleSignIn =GoogleSignIn(scopes: ['email']);
  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _pass=TextEditingController();
  bool isloding=false;

  @override
   void dispose() {
   _name.dispose();
   _email.dispose();
   _pass.dispose();
   super.dispose();
  }
 void singupuser()async{
    setState(() {
      isloding=true;
    });
    String res=await AuthMethod().signupuser(email:_email.text, password: _pass.text,username: _name.text);
    print(res);
    Navigator.pushNamed(context, Registration.id);
    setState(() {
     isloding=false;
   });
   
  }
  
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child:
             Image.asset("images/icon2.png",width: size.width*0.6,height: size.height*0.3,)),
             Padding(padding: EdgeInsets.only(top: size.height*0.3,left: size.width*0.09,right: size.width*0.09),
             child:   SingleChildScrollView(
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: vred,
                            boxShadow: [
                              // ignore: prefer_const_constructors
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        height: size.height * 0.5,
                        width: size.width * 0.98,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child:LoginForm2(
                                hintext: "Enter Name",
                                textInput: TextInputType.emailAddress,
                                controller: _name,
                              )
                            ),
                             Padding(
                              padding: EdgeInsets.all(8.0),
                              child:LoginForm2(
                                hintext: "Enter Email",
                                textInput: TextInputType.emailAddress,
                                controller: _email,
                              )
                            ),
                           Padding(
                             padding:  EdgeInsets.all(8.0),
                             child:LoginForm(
                               hintext: "Enter Password",
                               isobscureText: true,
                               controller: _pass,
                             )
                           ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            InkWell(
                              onTap: () {
                                singupuser();
                              },
                              child: Container(
                                height: size.height * 0.07,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                    color: vwhite,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child:isloding?CircularProgressIndicator(color: vred,) :Text(
                                    "Sing Up",
                                    style: TextStyle(
                                        color: vred, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    
                    SizedBox(
                      height: size.height*0.04
                    ),
                      InkWell(
                        onTap: ()async{
                           final googleUser=  await _googleSignIn.signIn();
                            final googleAuth =await googleUser!.authentication;
                            final credential=GoogleAuthProvider.credential(
                             accessToken: googleAuth.accessToken,
                            idToken: googleAuth.idToken);
                            await FirebaseAuth.instance.signInWithCredential(credential);
                            setState(() {});
                            Navigator.pushNamed(context, Registration.id);
                        },
                        child: Container(
                          height: size.height*0.06,
                          width: size.width*0.4,
                          decoration: BoxDecoration(
                          color: vwhite,
                        
                          boxShadow:[
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 20
                          )
                          ],
                          borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sign up with",style: TextStyle(
                                   color: vred
                                ),),
                                Image.asset("images/Google.png",height: size.height*0.05,)
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      Text("Already Regestred?"+ " Logn in!",style: TextStyle(
                        color: vred
                      ),),
                 
                  ],
                ),
             ),
             ),
        ],
      ),
    );
  }
}