import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const HomeAppBar(
        goodKeyword: 'Evening',
        name: 'Amanat Singh',
      ),
      backgroundColor: const Color.fromARGB(255, 255, 226, 202),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 2/100 * screenSize.width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            HomeCard(width: 95/100 * screenSize.width),

          ],
        ),
      ),
    );
  }
}
