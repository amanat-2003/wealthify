import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        goodKeyword: 'Evening',
        name: 'Amanat Singh',
      ),
      backgroundColor: const Color.fromARGB(255, 255, 226, 202),
      body: Padding(
        padding:  const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            HomeCard()],
        ),
      ),
    );
  }
}

