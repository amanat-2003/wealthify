import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double toolbarHeight = 100;
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

  const CustomBox({super.key, 
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
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}



class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          Container(
            height: 220,
            width: 285,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                color: Colors.white),
          ),
          Container(
            height: 220,
            width: 285,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              gradient: LinearGradient(
                  colors: [Colors.black45, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0, 1]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'This month',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.search, color: Colors.white, size: 30),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Available Balance',
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '₹21,600',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Spending',
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '₹2,120',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Income',
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '₹23,720',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
          height: 220,
          width: 85,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 255, 197, 120),Color.fromARGB(255, 255, 137, 40)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text('₹', style: TextStyle(color: Colors.white, fontSize: 40),),
                SizedBox(height: 10,),
                Text('\$', style: TextStyle(color: Colors.white, fontSize: 25),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}