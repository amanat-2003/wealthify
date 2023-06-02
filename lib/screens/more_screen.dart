import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

    @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 240, 228),
      child: const Center(child: Text('Add Screen')),
    );
  }
}