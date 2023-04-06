// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, file_names, implementation_imports, unused_import, unnecessary_import, must_be_immutable

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Activities extends StatelessWidget {
  String varNameActivity;
  bool varStatus;
  Function changeStatus;
  int iii;
  Function deleteActivity;

  Activities({
    super.key,
    required this.varNameActivity,
    required this.varStatus,
    required this.changeStatus,
    required this.iii,
    required this.deleteActivity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(iii);
      },
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.amber[300],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                varNameActivity,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
             
              Row(
                children: [
                  Icon(
                    varStatus ? Icons.check : Icons.close,
                    color: varStatus ? Colors.green : Colors.red,
                    size: 35,
                  ),
                   IconButton(onPressed: (){
                deleteActivity(iii);
              },
               icon: Icon(Icons.delete)
               )
                ],
                
              ),
             
             
      
            ],
          ),
        ),
      ),
    );
  }
}
