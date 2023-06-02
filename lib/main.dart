import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wealthify/screens/accounts_screen.dart';
import 'package:wealthify/screens/add_screen.dart';
import 'package:wealthify/screens/analysis_screen.dart';
import 'package:wealthify/screens/home_screen.dart';
import 'package:wealthify/screens/more_screen.dart';
import 'package:wealthify/screens/nome_2.dart';

import 'widgets/home_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = const [
    Icon(
      Icons.people,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.analytics_outlined,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.add,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.person,
      size: 30,
      color: Colors.white,
    ),
    Icon(
      Icons.search_outlined,
      size: 30,
      color: Colors.white,
    )
  ];

  int _index = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        goodKeyword: 'Evening',
        name: 'Amanat Singh',
      ),
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 255, 240, 228),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: _index,
        key: _bottomNavigationKey,
        onTap: (selctedIndex) {
          setState(() {
            _index = selctedIndex;
          });
        },
        height: 60,
        backgroundColor: Colors.transparent,
        color: const Color.fromARGB(255, 206, 7, 186),
        animationDuration: const Duration(milliseconds: 300),
      ),
      body: body(index: _index),
    );
  }

  Widget body({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const HomeScreenBody();
        break;
      case 1:
        widget = const AnalysisScreen();
        break;
      case 2:
        widget = const AddScreen();
        break;
      case 3:
        widget = const AccountsScreen();
        break;
      case 4:
        widget = const MoreScreen();
        break;
      default:
        widget = const HomeScreen2();
        break;
    }
    return widget;
  }
}
