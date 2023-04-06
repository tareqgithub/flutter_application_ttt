// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, implementation_imports, unnecessary_import, unused_import, must_be_immutable, unnecessary_brace_in_string_interps, file_names

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  int CounterCheck;
  int CounterList;

  Counter({super.key, required this.CounterCheck, required this.CounterList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "${CounterCheck}/${CounterList}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  color: (CounterCheck==CounterList) ? Colors.amber[300] : Colors.white,
                   fontSize: 45),
            ),
          ),
        ],
      ),
    );
  }
}
