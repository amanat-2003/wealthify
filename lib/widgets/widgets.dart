import 'package:flutter/material.dart';


class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        decoration: _boxDecoration(),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 5),
              CustomBox(height: 50, width: 90, hintText: 'hintText')
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

BoxDecoration _boxDecoration() {
  return BoxDecoration(
    borderRadius: const BorderRadius.vertical(
      bottom: Radius.circular(20),
    ),
    gradient: LinearGradient(
      colors: [Colors.purple, Colors.purple.shade200],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.purple.shade900,
        offset: const Offset(0, 4),
        blurRadius: 8,
      ),
    ],
  );
}

class CustomBox extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;

  CustomBox({
    required this.height,
    required this.width,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.purple.shade600), // Add the border
        gradient: LinearGradient(
          colors: [Colors.purple.shade200, Colors.purple.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 5),
          child: Text(hintText,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
