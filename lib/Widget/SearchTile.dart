// ignore_for_file: file_names, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rakatdaan/Util/Colors/Color.dart';

class SearchTile extends StatefulWidget {
  const SearchTile({ Key? key }) : super(key: key);

  @override
  _SearchTileState createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
  List<String> _blood=["A+","A-","B+","B-","O+","O-","AB+","AB-"];
   String? _selectedgroup; 
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      
      height: size.height*0.08,
      width: size.width*0.8,
      decoration: BoxDecoration(
       color: Colors.white ,
       borderRadius: BorderRadius.circular(40)
      ),
      child: Row(
        children: [
          Padding(
            padding:  EdgeInsets.only(left:size.width*0.05),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DropdownButton(
                underline: SizedBox(),
                hint: Text("Select Blood Group"),
                onChanged: (String? newvalue){
                  setState(() {
                  _selectedgroup=newvalue;
                  });
                },
                value: _selectedgroup,
                items: _blood.map((bloodgroup) {
                   return DropdownMenuItem(
                    child:Text(bloodgroup),
                    value: bloodgroup,
                     );
                }).toList()
              ),
            ),
          ),
          SizedBox(
            width: size.width*0.2,
          ),
          Icon(Icons.search,color: Colors.grey,)
        ],
      ),

    );
  }
}