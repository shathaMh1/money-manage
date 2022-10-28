import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Basic {
  net,
  car,
}

enum Home {
  elec,
  rent,
}

enum Loan {
  loan,
}

class _HomeScreenState extends State<HomeScreen> {
  Basic? basicSelected = Basic.net;
  Home? homeSelected = Home.elec;
  Loan? loanSelected = Loan.loan;

  int salary = 0;
  int expenses = 0;
  int savings = 0;
  List historyList = [];

  @override
  void initState() {
    salary = box.read('salary');
    expenses = box.read('expenses');
    savings = box.read('savings');
    historyList = box.read('historyList');
    super.initState();
  }

// historylist = [
//   {'value' : dddd , 'title' : jjjj, 'subtitle' : ffff},
//   {'value' : dddd , 'title' : jjjj, 'subtitle' : ffff},
//   {'value' : dddd , 'title' : jjjj, 'subtitle' : ffff},
//   {'value' : dddd , 'title' : jjjj, 'subtitle' : ffff},
//   {'value' : dddd , 'title' : jjjj, 'subtitle' : ffff},
//   {'value' : dddd , 'title' : jjjj, 'subtitle' : ffff},
//   {'value' : dddd , 'title' : jjjj, 'subtitle' : ffff},
//   {'value' : dddd , 'title' : jjjj, 'subtitle' : ffff},
// ]

  @override
  Widget build(BuildContext context) {
    final savingController = TextEditingController();
    final basicController = TextEditingController();
    final homeController = TextEditingController();
    final loanController = TextEditingController();

    addToExpenses(
        {required int value, required String title, required String subtitle}) {
      setState(() {
        expenses += value;

        historyList.add({
          'value': value,
          'title': title,
          'subtitle': subtitle,
        });

        box.write('expenses', expenses);
        box.write('historyList', historyList);

        print(historyList);
      });
    }

    addToSavings(int value) {
      setState(() {
        savings += value;
        box.write('savings', savings);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(248, 248, 248, 0.92),
        elevation: 1,
        title: const Text(
          'المصاريف',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 80,
                    child: Center(
                      child: Text(
                        '${salary - (expenses + savings)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'الرصيد',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 90,
                    child: Center(
                        child: Text(
                      '$savings',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: SizedBox(
                                height: 120,
                                width: 60,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: savingController,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          hintText: 'اضف إلي مدخراتك'),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        addToSavings(
                                          int.parse(savingController.text),
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('اضافة'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: const Text(
                      'المدخرات',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 80,
                    child: Center(
                      child: Text(
                        '$expenses',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'المصاريف',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Text(
                  'المصاريف',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, state) {
                          return Container(
                            height: 330,
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
                                    'اختر',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Radio(
                                          value: Basic.net,
                                          groupValue: basicSelected,
                                          onChanged: (Basic? value) {
                                            state(() {
                                              basicSelected = value;
                                            });
                                          }),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('انترنت'),
                                      Radio(
                                          value: Basic.car,
                                          groupValue: basicSelected,
                                          onChanged: (Basic? value) {
                                            state(() {
                                              basicSelected = value;
                                            });
                                          }),
                                      const Text('سيارة'),
                                    ],
                                  ),
                                  const Text(
                                    'المبلغ',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: basicController,
                                    decoration: InputDecoration(
                                      hintText: '00.00',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      suffixText: 'SAR',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: StatefulBuilder(
                                        builder: (context, sstate) {
                                      return ElevatedButton(
                                        onPressed: () {
                                          addToExpenses(
                                            value:
                                                int.parse(basicController.text),
                                            title: 'التزامات شخصية',
                                            subtitle: basicSelected == Basic.net
                                                ? 'انترنت'
                                                : 'سيارة',
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('ADD'),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      });
                },
                child: Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(16),
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
                              'التزامات شخصية',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/basicsicon.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, state) {
                          return Container(
                            height: 330,
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
                                    'اختر',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Radio(
                                          value: Home.elec,
                                          groupValue: homeSelected,
                                          onChanged: (value) {
                                            state(() {
                                              homeSelected = value;
                                            });
                                          }),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text('كهرباء'),
                                      Radio(
                                          value: Home.rent,
                                          groupValue: homeSelected,
                                          onChanged: (value) {
                                            state(() {
                                              homeSelected = value;
                                            });
                                          }),
                                      const Text('إيجار'),
                                    ],
                                  ),
                                  const Text(
                                    'المبلغ',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: homeController,
                                    decoration: InputDecoration(
                                      hintText: '00.00',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      suffixText: 'SAR',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        addToExpenses(
                                          value: int.parse(homeController.text),
                                          title: 'البيت',
                                          subtitle: basicSelected == Home.elec
                                              ? 'كهرباء'
                                              : 'ايجار',
                                        );

                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('ADD'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      });
                },
                child: Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(16),
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
                              'البيت',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/homeicon.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder: (context, state) {
                          return Container(
                            height: 330,
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
                                    'اختر',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Radio(
                                          value: Loan.loan,
                                          groupValue: loanSelected,
                                          onChanged: (value) {
                                            state(() {
                                              loanSelected = value;
                                            });
                                          }),
                                      const Text('قرض'),
                                    ],
                                  ),
                                  const Text(
                                    'المبلغ',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    controller: loanController,
                                    decoration: InputDecoration(
                                      hintText: '00.00',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      suffixText: 'SAR',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        addToExpenses(
                                          value: int.parse(loanController.text),
                                          title: 'القرض',
                                          subtitle: 'القرض',
                                        );
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('ADD'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      });
                },
                child: Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(16),
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
                              'القرض',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/loanicon.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
