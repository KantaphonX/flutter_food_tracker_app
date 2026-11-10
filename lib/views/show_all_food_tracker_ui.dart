// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_food_tracker_app/views/add_food_tracker_ui.dart';

class ShowAllFoodTrackerUI extends StatefulWidget {
  const ShowAllFoodTrackerUI({super.key});

  @override
  State<ShowAllFoodTrackerUI> createState() => _ShowAllFoodTrackerUIState();
}

class _ShowAllFoodTrackerUIState extends State<ShowAllFoodTrackerUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วน AppBar
      appBar: AppBar(
        title: Text(
          'Food Tracker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 246, 65, 9),
        centerTitle: true,
      ),
      // ส่วน floatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFoodTrackerUI(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 246, 65, 9), // สีปุ่ม
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // ปรับความโค้งของปุ่ม
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // ส่วน body
      body: Center(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/burger.png',
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
