import 'package:flutter/material.dart';
import 'package:meet/colors/colors.dart';
import 'package:meet/component/custom_button.dart';
import 'package:meet/resourses/auth_method.dart';
import 'history_meeting_screen.dart';
import 'meeting-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  OnPageChanged(int page ){
    setState(() {
      _page = page;
    });


  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Really you want to log out ?',style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.bold
        ),) ,
        const SizedBox(height: 20,) ,
        Center(child: CustomButton(text: 'Log Out', onPressed:()=> AuthMethods().signOut() ,)),
      ],
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Meet & Chat'),
      ),

      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 13,
        onTap: OnPageChanged,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: 'Meeeting\'s',),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
      ),
      body: pages[_page],
    );
  }
}

