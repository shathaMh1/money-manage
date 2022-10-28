import 'package:flutter/material.dart';
import 'package:personal_expenses/screens/chart_screen.dart';
import 'package:personal_expenses/screens/history_screen.dart';
import 'package:personal_expenses/screens/home_screen.dart';
import 'package:personal_expenses/screens/settings_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _pages = const [
    {'title': 'Home', 'screen': HomeScreen()},
    {'title': 'Chart', 'screen': ChartScreen()},
    {'title': 'History', 'screen': HistoryScreen()},
    {'title': 'Settings', 'screen': SettingsScreen()},
  ];

  void _selectedPage(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money_rounded,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart_rounded,
              size: 30,
            ),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_drive_file_outlined,
              size: 30,
            ),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
