// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double toolbarHeight = 120;
  final String goodKeyword;
  final String name;

  const HomeAppBar({
    Key? key,
    required this.goodKeyword,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: toolbarHeight,
      flexibleSpace: Container(
        decoration: _boxDecoration(),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Good $goodKeyword',
                style: const TextStyle(
                    color: Color(0xff000000),
                    fontSize: 14,
                    fontWeight: FontWeight.w400)),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.all(1.6), // Border width
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(30), // Image radius
                  child: Image.asset('assets/photo.png', fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 206, 7, 186), Color(0xFFFFB228)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // stops: [0.01, 1.0]
        ));
  }
}

class CustomBox extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;

  const CustomBox({
    super.key,
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
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    final w1 = 0.7702 * width;
    final w2 = 0.2298 * width;
    final height = 0.59459 * width;
    final borderRadius = 3 / 37 * width;
    final internalPadding = 16 / 370 * width;
    final bigFontSize = 25 / 370 * width;
    final smallFontSize = 13 / 370 * width;
    final selectedSize = 4 / 37 * width;
    final unSelectedSize = 3 / 37 * width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          Container(
            height: height,
            width: w1,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
                color: Colors.white),
          ),
          Container(
            height: height,
            width: w1,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                bottomLeft: Radius.circular(borderRadius),
              ),
              gradient: const LinearGradient(
                colors: [Colors.black45, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(internalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        'This month',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: bigFontSize,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.search, color: Colors.white, size: unSelectedSize),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'Available Balance',
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: smallFontSize,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '₹21,600',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: bigFontSize,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            'Spending',
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: smallFontSize,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '₹2,120',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: bigFontSize,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            'Income',
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: smallFontSize,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '₹23,720',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: bigFontSize,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
        Container(
          height: height,
          width: w2,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 197, 120),
                Color.fromARGB(255, 255, 137, 40)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.all(internalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Text(
                  '₹',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: selectedSize,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: unSelectedSize,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
