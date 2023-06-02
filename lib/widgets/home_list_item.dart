import 'package:flutter/material.dart';

import 'gradient_box.dart';

class HomeListItem extends StatelessWidget {
  final double? width;
  final IconData icon;
  final String title;
  final String time;
  final bool isExpense;
  final String amount;

  const HomeListItem({
    Key? key,
    this.width,
    required this.icon,
    required this.title,
    required this.time,
    required this.isExpense,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = width ?? MediaQuery.of(context).size.width;
    final adjustmentFactor = screenWidth / 430;
    return Column(
      children: [
        Row(
          children: [
            CustomBox(
              side: 6 / 43 * screenWidth,
              icon: icon,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 335 / 430 * screenWidth,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15 * adjustmentFactor,
                            bottom: 5 * adjustmentFactor),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: const Color(0xff323232),
                            fontSize: 19 * adjustmentFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5 * adjustmentFactor),
                        child: Text(
                          '${(isExpense ? '-' : '+')} ₹$amount',
                          style: TextStyle(
                            color: isExpense ? Colors.red : Colors.green,
                            fontSize: 22 * adjustmentFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15 * adjustmentFactor),
                  child: Text(
                    time,
                    style: TextStyle(
                      color: const Color.fromARGB(222, 121, 121, 121),
                      fontSize: 13 * adjustmentFactor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(color: Colors.brown),
      ],
    );
  }
}