import 'package:flutter/material.dart';
import 'package:flutter_food_tracker_app/views/show_all_food_tracker_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // หน่วงเวลา 3 วินาที ก่อนเปลี่ยนไปหน้า ShowAllFoodTrackerUI
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ShowAllFoodTrackerUI(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 65, 9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/burger.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(
              'Food Tracker',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.09,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
            Text(
              '🍔🍟🌭🍿🍨🧁',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
