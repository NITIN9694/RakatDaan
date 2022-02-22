// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, prefer_final_fields



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import  'package:rakatdaan/Firebasedata/Authclass.dart';
import 'package:rakatdaan/Screens/HomeScreen.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';
import 'package:rakatdaan/Widget/Loginform.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static String id = "sign_in";
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GoogleSignIn _googleSignIn =GoogleSignIn(scopes: ['email']);
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isloding =false;

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  
  void loginuser()async{
    setState(() {
      isloding=true;
    });
    String res=await AuthMethod().loginUser(email:_email.text, password: _password.text);
    print(res);
    Navigator.pushNamed(context, Homescreen.id);
    setState(() {
     isloding=false;
   });
   
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Stack(children: [
              Image.asset(
                "images/icon.png",
                height: size.height * 0.3,
                width: size.width,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.3,
                        left: size.width * 0.09,
                        right: size.width * 0.09),
                    child: Container(
                      decoration: BoxDecoration(
                          color: vred,
                          boxShadow: [
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
                             controller: _password,
                           )
                         ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          InkWell(
                            onTap: () {
                            loginuser();
                              },
                            child: Container(
                              height: size.height * 0.07,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: vwhite,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child:isloding?CircularProgressIndicator(color: vred,) :Text(
                                  "Log in",
                                  style: TextStyle(
                                      color: vred, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.04
                  ),
                    Container(
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
                      child: InkWell(
                        onTap: ()async{
                           final googleUser=  await _googleSignIn.signIn();
                            final googleAuth =await googleUser!.authentication;
                            final credential=GoogleAuthProvider.credential(
                             accessToken: googleAuth.accessToken,
                            idToken: googleAuth.idToken);
                            await FirebaseAuth.instance.signInWithCredential(credential);
                            setState(() {});
                            Navigator.pushNamed(context, Homescreen.id);

                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Log in with",style: TextStyle(
                                 color: vred
                              ),),
                              Image.asset("images/Google.png",height: size.height*0.05)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    InkWell(
                      child: Text("Not Regestred?"+ " Signup!",style: TextStyle(
                        color: vred
                      ),),
                    ),
               
                ],
              ),
              
            ]),
          ),
        ),
      ),
    );
  }
}
