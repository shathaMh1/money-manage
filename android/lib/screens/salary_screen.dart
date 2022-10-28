import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/btm_bar_screen.dart';
import 'package:personal_expenses/screens/consts.dart';

// int globalSalary = 0;
// int expenses = 0;
// int savings = 0;
// List<Map> historyList = [];

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({super.key});

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  int expenses = 0;
  int savings = 0;
  List historyList = [];

  void setSalary(int salary) {
    setState(() {
      box.write('salary', salary);
      box.write('expenses', expenses);
      box.write('savings', savings);
      box.write('historyList', historyList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final salaryController = TextEditingController();
    final dateController = TextEditingController();
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(155, 166, 250, 1),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'الدخل',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: salaryController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: '00.00',
                suffixText: 'SAR',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'التاريخ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dateController,
              keyboardType: TextInputType.datetime,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                  ),
                ),
                hintText: 'd/m/y',
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(155, 166, 250, 1),
                ),
                onPressed: () {
                  // globalSalary = int.parse(salaryController.text);
                  setSalary(int.parse(salaryController.text));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return const BottomBarScreen();
                    },
                  ));
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
