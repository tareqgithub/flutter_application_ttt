// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, dead_code, sized_box_for_whitespace, unused_element, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_ttt/widgets/Activities.dart';
import 'package:flutter_application_ttt/widgets/Counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyActivities(),
    );
  }
}

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.amber[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                      color: Colors.amber[300],
                      height: 200,
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: mycontroller,
                            style: TextStyle(fontSize: 20),
                            maxLength: 20,
                            decoration:
                                InputDecoration(hintText: "Add New Activity"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pop(context);
                                AddNewList();
                                removeCurrentText();
                              });
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      )),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.5),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                list.removeRange(0, list.length);
              });
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 30,
            color: Colors.white,
          ),
        ],
        backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
        title: Text(
          "MY ACTIVITIES",
          style: TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Counter(CounterCheck: StatusCheck(), CounterList: list.length),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 600,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Activities(
                    varNameActivity: list[index].NameActivity,
                    varStatus: list[index].status,
                    changeStatus: changeState,
                    deleteActivity: deleteActivity,
                    iii: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List list = [
    Task(NameActivity: "Collage", status: false),
    Task(NameActivity: "Gym", status: true),
    Task(NameActivity: "Call Dad", status: false),
  ];

  final mycontroller = TextEditingController();

  void removeCurrentText() {
    setState(() {
      mycontroller.text = "";
    });
  }

  int StatusCheck() {
    int counter = 0;
    for (var element in list) {
      if (element.status) {
        counter++;
      }
    }
    return counter;
  }

  void changeState(int i) {
    setState(() {
      list[i].status = !list[i].status;
    });
  }

  void deleteActivity(int i) {
    setState(() {
      list.remove(list[i]);
    });
  }

  void AddNewList() {
    setState(() {
      list.add(
        Task(NameActivity: mycontroller.text, status: false),
      );
    });
  }
}

class Task {
  String NameActivity;
  bool status;
  Task({required this.NameActivity, required this.status});
}
