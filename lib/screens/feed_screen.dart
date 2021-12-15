// import 'package:calender/home_screen.dart';
// import 'package:flutter/material.dart';
//
// class FeedScreen extends StatelessWidget {
//   const FeedScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: [
//         HomeScreen(),
//         SearchScreen(),
//         NotificationsScreen(),
//         MessageScreen(),
//       ].elementAt(bottomTabIndex),
//       bottomNavigationBar: CupertinoTabBar(
//         onTap: (index) {
//           context.read(bottomTabProvider.notifier).update(index: index);
//         },
//         activeColor: Colors.blue,
//         currentIndex: bottomTabIndex,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home)),
//           BottomNavigationBarItem(icon: Icon(Icons.search)),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.notifications_none_outlined)),
//           BottomNavigationBarItem(icon: Icon(Icons.mail_outline_rounded)),
//         ],
//       ),
//     );
//   }
// }

import 'package:calender/screens/home_screen.dart';
import 'package:calender/screens/multi_screen.dart';
import 'package:calender/screens/range_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  FeedScreen();

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(),
        RangeScreen(),
        MultiScreen(),
        // MessageScreen(),
      ].elementAt(_selectedTab),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        activeColor: Colors.blue,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.circle)),
          BottomNavigationBarItem(icon: Icon(Icons.add)),
          // BottomNavigationBarItem(icon: Icon(Icons.mail_outline_rounded)),
        ],
      ),
    );
  }
}
