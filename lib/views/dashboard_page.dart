
import 'package:campus_connect/views/calendar_view.dart';
import 'package:campus_connect/views/home_view.dart';
import 'package:campus_connect/views/profile_view.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const new({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var pageIndex = 0;
  var pages = [HomeView(), CalendarView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) => {
          setState(() {
            pageIndex = value;
          }),
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
