import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/btm_bar_screen.dart';
import 'package:personal_expenses/screens/consts.dart';
import 'package:personal_expenses/screens/salary_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Welcome',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              if (box.read('salary') != null) {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const BottomBarScreen();
                  },
                ));
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SalaryScreen();
                    },
                  ),
                );
              }
            },
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
