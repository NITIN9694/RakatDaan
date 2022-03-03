// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, use_key_in_widget_constructors, non_constant_identifier_names, curly_braces_in_flow_control_structures, avoid_print, unused_element

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rakatdaan/Firebasedata/Registrationdata.dart';

import 'package:rakatdaan/Screens/HomeScreen.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';
import 'package:rakatdaan/Widget/Formfiled.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  static String id = "Registration";
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool loadingLocation = false;
  late Position _currentPosition;
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _country = TextEditingController();

  List<String> _blood = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  String? _selectedgroup;
  bool? male = false;
  bool? Female = false;
  String? gender = "";

  void getname() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // TODO: implement initState
    setState(() {
      _firstname.text = preferences.getString("name")!;
    });
  }

  @override
  void initState() {
    getname();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: vred,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/blood.png",
                      height: size.height * 0.1,
                      color: vwhite,
                    ),
                    Text(
                      "रक्तदान",
                      style: TextStyle(color: vwhite),
                    ),
                  ],
                )),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.05, right: size.height * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.4,
                            child: FormFieldComp(
                              controller: _firstname,
                              hintText: "First Name",
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Expanded(
                            child: SizedBox(
                              width: size.width * 0.4,
                              child: FormFieldComp(
                                controller: _lastname,
                                hintText: "Last Name",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                            color: vwhite,
                            borderRadius: BorderRadius.circular(30.0)),
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          controller: _phone,
                          cursorColor: vred,
                          keyboardType: TextInputType.phone,
                          validator: (value) {},
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: vred,
                          ),
                          // controller: controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 21),
                            hintText: "Enter Phone Number",
                            hintStyle: TextStyle(color: vred),
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        decoration: BoxDecoration(
                            color: vwhite,
                            borderRadius: BorderRadius.circular(30.0)),
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextFormField(
                          controller: _location,
                          cursorColor: vred,
                          keyboardType: TextInputType.phone,
                          validator: (value) {},
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: vred,
                          ),
                          // controller: controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 21),
                              hintText: "Location",
                              hintStyle: TextStyle(color: vred),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.my_location_outlined,
                                color: vred,
                                size: 20,
                              )),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "Select Gender",
                        style: TextStyle(
                            color: vwhite,
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(unselectedWidgetColor: vwhite),
                            child: Checkbox(
                                activeColor: vwhite,
                                checkColor: vred,
                                tristate: false,
                                value: male,
                                onChanged: (bool? vlue) {
                                  setState(() {
                                    male = vlue;
                                    gender = "Male";
                                    print(gender.toString());
                                  });
                                }),
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                                color: vwhite, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Theme(
                            data: ThemeData(unselectedWidgetColor: vwhite),
                            child: Checkbox(
                                activeColor: vwhite,
                                checkColor: vred,
                                tristate: false,
                                value: Female,
                                onChanged: (bool? vlue) {
                                  setState(() {
                                    Female = vlue;
                                    gender = "FEMALE";
                                    print(gender.toString());
                                  });
                                }),
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                                color: vwhite, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Container(
                        height: size.height * 0.09,
                        width: size.width * 0.85,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.05),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: DropdownButton(
                                    underline: SizedBox(),
                                    hint: Text(
                                      "Select Blood Group",
                                      style: TextStyle(color: vred),
                                    ),
                                    onChanged: (String? newvalue) {
                                      setState(() {
                                        _selectedgroup = newvalue;
                                        print(_selectedgroup.toString());
                                      });
                                    },
                                    value: _selectedgroup,
                                    items: _blood.map((bloodgroup) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          bloodgroup,
                                          style: TextStyle(color: vred),
                                        ),
                                        value: bloodgroup,
                                      );
                                    }).toList()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Center(
                          child: InkWell(
                        onTap: () async {
                          Position p = await Geolocator.getCurrentPosition();
                          print(p.latitude);
                          print(p.longitude);
                          StoreData().signupuser(
                              name: _firstname.text,
                              lastname: _lastname.text,
                              phonenumber: _phone.text,
                              lat: p.latitude.toDouble(),
                              long: p.longitude.toDouble(),
                              blodgroup: _selectedgroup.toString(),
                              gender: gender.toString());

                          Navigator.pushNamed(context, Homescreen.id);
                        },
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width * 0.5,
                          decoration: BoxDecoration(
                              color: vwhite,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(
                                  color: vred, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition.latitude.toString());
      });
    }).catchError((e) {
      print(e);
    });
    // print(_currentPosition.latitude.toString());
    // print(_currentPosition.longitude.toString());
  }
  // Future<void> getCurrentLocation() async {
  //   // SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (mounted)
  //     setState(() {
  //       loadingLocation = true;
  //     });
  //   try {
  //       // _location.text="hui";
  //      Position p = await Geolocator.getCurrentPosition();

  //     print(p.latitude);
  //      print(p.longitude);
  //     _currentPosition=p;

  //     // _location.text = '(${p.longitude}, ${p.latitude})';
  //     List<Placemark> placemarks =
  //     await placemarkFromCoordinates(p.latitude, p.longitude);

  //     Placemark place = placemarks[0];
  //     print(place.subLocality+place.locality);
  //      setState(() {
  //      _location.text = "${place.subLocality +" "+place.locality+" "+place.postalCode} ";
  //      _city.text ="${place.locality}";
  //      _country.text="${place.country}";
  //     loadingLocation = false;
  //    });

  //   } catch (e) {
  //     print(e.toString);
  //   }
  // }
}
