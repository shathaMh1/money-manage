import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/consts.dart';
// import 'package:personal_expenses_new/screens/consts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(155, 166, 250, 1),
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(155, 166, 250, 1),
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // int salary = 0;
  void setSalary(int salary) {
    setState(() {
      box.write('salary', salary);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController salaryController = TextEditingController();

    final TextEditingController dateController = TextEditingController(
        text: '${(selectedDate.toLocal())}'.split(' ')[0]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(248, 248, 248, 0.92),
        elevation: 1,
        title: const Text(
          'الاعدادات',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return StatefulBuilder(builder: (context, state) {
                  return Container(
                    height: 430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 30, right: 30, bottom: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(
                                    Icons.close_outlined,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              ':المبلغ',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: salaryController,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: '00.00',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixText: ('SAR')),
                              ),
                            ),
                            const Text(
                              ':تاريخ الراتب',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              child: TextField(
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
                                    onPressed: () {
                                      state(() {
                                        _selectDate(context);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.calendar_today_outlined,
                                    ),
                                  ),
                                  hintText: 'd/m/y',
                                ),
                              ),
                            ),
                            Container(
                              width: 180,
                              padding: const EdgeInsets.all(40),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(155, 166, 250, 1),
                                ),
                                onPressed: () {
                                  setSalary(int.parse(salaryController.text));

                                  Navigator.of(context).pop();
                                },
                                child: const Text('تغيير'),
                              ),
                            ),
                          ]),
                    ),
                  );
                });
              });
        },
        child: Card(
          elevation: 1.0,
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/arrow-down.png'),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'الراتب',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 196, 140, 1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/money.png',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
