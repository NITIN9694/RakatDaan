
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class AuthMethod{
  
  final FirebaseAuth _auth= FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;
  

  /*resgister user*/ 
   Future<String> signupuser({required String email,required String password,required String username,})async{
   String res ="Some Error occured";
   try{
    UserCredential credential=await  _auth.createUserWithEmailAndPassword(email:email, password: password);
    print(credential.user!.uid);
  
    /* add user to database */
    // await  _firestore.collection("users").doc(credential.user!.uid).set({
    //   'username':username,
    //   'uid':credential.user!.uid,
     
    //   'email':email,
      
    // });
    res="succes";
    
    }
   catch(e){
     res=e.toString();
   }
   return res.toString();
  }


  //signin User
   Future <String>loginUser({
    required String email,
    required String password,
  })async{
    String res="some thing happend";
    try {
      _auth.signInWithEmailAndPassword(email: email, password: password);
      res="succes";
    }on FirebaseAuthException catch (e) {
    res=e.toString();
     }
     return res.toString();
  }
  
}