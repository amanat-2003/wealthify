import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
     preferredSize: const Size.fromHeight(4.0),
     child: Container(
        color: Colors.orange,
        height: 4.0,
     )),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 100,
          title: const Text("Custom App Bar"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: _boxDecoration(),
          ),
        ),
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Color(0xFF6f0765),Color(0xFFFFB228)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          );
  }
}
