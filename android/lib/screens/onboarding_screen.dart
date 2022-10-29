// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:personal_expenses/screens/salary_screen.dart';
// import 'package:personal_expenses/screens/salary_screen.dart';
// import 'package:personal_expenses_new/screens/salary_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // height:  MediaQuery.of(context).size.height / 1.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/savings.png'))),
            ),
            Container(
              child: Align(
                
                alignment: Alignment.center,
                child: Center(child: Text(
                  'قلل مصروفاتك وحسن من ادارة اموالك\n  وتنمية'
                  ' مدخراتك باستخدام مصاريف ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: '.SF Pro Display',
                    // textAlign: TextAlign.center,
                  ),
                ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const SalaryScreen();
                    },
                  ));
                  // Get.to(SalaryScreen());
                },
                child: const Text('ابدأ  ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(155, 166, 250, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
