import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreData {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /*resgister user*/
  Future<String> signupuser(
      {required String name,
      required String lastname,
      required String phonenumber,
      required double lat,
      required double long,
      required String blodgroup,
      required String gender}) async {
    String res = "Some Error occured";
    try {
      UserCredential? credential;
      /* add user to database */
      await _firestore.collection("users").doc(credential?.user!.uid).set({
        'Name': name,
        'Lastname': lastname,
        'PhoneNumber': phonenumber,
        'latitude': lat,
        'longitude': long,
        'BloodGroup': blodgroup,
        'Gender': gender,
        'uid': credential?.user!.uid,
      });
      res = "succes";
    } catch (e) {
      res = e.toString();
    }
    return res.toString();
  }
}
