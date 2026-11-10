// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddFoodTrackerUI extends StatefulWidget {
  const AddFoodTrackerUI({super.key});

  @override
  State<AddFoodTrackerUI> createState() => _AddFoodTrackerUIState();
}

class _AddFoodTrackerUIState extends State<AddFoodTrackerUI> {
  // ตัวแปรเก็บมื้อที่เลือก
  String selectedMeal = 'เช้า'; // ค่าเริ่มต้นเป็น 'เช้า'

  List<String> meals = ['เช้า', 'กลางวัน', 'เย็น', 'ว่าง']; // รายการมื้ออาหาร

  // ประกาศตัวแปรสำหรับ TextEditingController เพื่อจัดการกับ TextField
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        // แปลงวันที่เป็นรูปแบบ "วัน/เดือน/ปี"
        _dateController.text =
            "${pickedDate.year}/${pickedDate.month}/${pickedDate.day}";
      });
    }
  }

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      // ส่วน body
      body: Padding(
        padding: const EdgeInsets.only(
          top: 25,
          left: 25,
          right: 25,
          bottom: 25,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                FaIcon(
                  FontAwesomeIcons.cameraRetro,
                  size: MediaQuery.of(context).size.width * 0.3,
                  color: Colors.grey[400],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินอะไร',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'เช่น KFC, Pizza',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินมื้อไหน',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                // เลือกมื้ออาหารแบบปุ่มกด 4 มื้ออาหาร (เช้า, กลางวัน, เย็น, ว่าง)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 10,
                    children: meals.map((meal) {
                      // เช็คว่าปุ่มนี้เป็นปุ่มที่ถูกเลือกหรือไม่
                      bool isSelected = selectedMeal == meal;

                      return ElevatedButton(
                        onPressed: () {
                          // เมื่อกดปุ่ม ให้เปลี่ยนค่า selectedMeal เป็นมื้อที่ถูกเลือก
                          setState(() {
                            selectedMeal = meal;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          // เปลี่ยนสีปุ่มตามสถานะการเลือก
                          backgroundColor: isSelected
                              ? Colors.green // สีปุ่มเมื่อถูกเลือก
                              : Colors.grey[400], // สีปุ่มเมื่อไม่ถูกเลือก
                          elevation:
                              isSelected ? 2 : 0, // เพิ่มเงาเมื่อถูกเลือก
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          meal,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors
                                    .white, // เปลี่ยนสีข้อความตามสถานะการเลือก
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินไปเท่าไหร่',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'เช่น 299.50',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินกันกี่คน',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'เช่น 3',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                // ส่วนเลือกวันที่
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'กินไปวันไหน',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                TextField(
                  controller: _dateController,
                  readOnly: true, // ทำให้ TextField ไม่สามารถแก้ไขได้โดยตรง
                  onTap: () => _selectDate(
                      context), // เมื่อกด TextField ให้เรียกฟังก์ชันเลือกวันที่
                  decoration: InputDecoration(
                    hintText: 'เช่น 2020-01-31',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(
                          context), // เมื่อกดไอคอนให้เรียกฟังก์ชันเลือกวันที่
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                // ส่วนปุ่มบันทึก
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'บันทึก',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                // ส่วนปุ่มยกเลิก
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
