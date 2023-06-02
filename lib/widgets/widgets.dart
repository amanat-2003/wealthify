import 'package:flutter/material.dart';

import '../constants/enums.dart';
import 'category_status_card.dart';
import 'gradient_box.dart';
import 'home_list_item.dart';


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
    final borderRadius = 2 / 37 * width;
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
                color: Colors.white),
          ),
          Container(
            height: height,
            width: w1,
            decoration: BoxDecoration(
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
                    children: [
                      Text(
                        'This month',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: bigFontSize,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(Icons.search,
                          color: Colors.white, size: unSelectedSize),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        children: [
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
                        children: [
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
          decoration: BoxDecoration(
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
            padding: EdgeInsets.all(internalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '₹',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: selectedSize,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: selectedSize / 4,
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

class RecentTransactionsPortion extends StatelessWidget {
  const RecentTransactionsPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  color: Color(0xff323232),
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CustomBox(
                height: 30,
                width: 100,
                text: 'See All',
                icon: Icons.list,
                foregroundColor: Color(0xff323232),
              ),
            ],
          ),
        ),

        const Divider(color: Colors.brown),

        const HomeListItem(
          icon: Icons.account_balance_outlined,
          amount: '30,000',
          isExpense: false,
          time: '01 June 2023, 10:25 AM',
          title: 'Salary',
        ),
        const HomeListItem(
          icon: Icons.snowboarding,
          amount: '10,000',
          isExpense: true,
          time: '01 December 2023, 10:25 AM',
          title: 'Winter Trip',
        ),
        const HomeListItem(
          icon: Icons.cake,
          amount: '5000',
          isExpense: true,
          time: '07 February 2023, 04:25 PM',
          title: 'Birthday Celebration',
        ),
      ],
    );
  }
}




class MonthlyTransactionsPortion extends StatelessWidget {
  const MonthlyTransactionsPortion({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 180;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Monthly Budget',
                style: TextStyle(
                  color: Color(0xff323232),
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CustomBox(
                height: 30,
                width: 100,
                text: 'Edit Budget',
                foregroundColor: Color(0xff323232),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: cardHeight,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                CategoryStatusCard(
                  icon: Icons.explore_outlined,
                  category: 'Electronics',
                  totalBudget: 100000,
                  spentBudget: 60000,
                  status: MonthlyLimitStatus.crossed,
                  heightOfCard: cardHeight,
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                CategoryStatusCard(
                  icon: Icons.explore_outlined,
                  category: 'Electronics',
                  totalBudget: 100000,
                  spentBudget: 60000,
                  status: MonthlyLimitStatus.warning,
                  heightOfCard: cardHeight,
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            Row(
              children: const [
                SizedBox(
                  width: 15,
                ),
                CategoryStatusCard(
                  icon: Icons.explore_outlined,
                  category: 'Electronics',
                  totalBudget: 100000,
                  spentBudget: 60000,
                  status: MonthlyLimitStatus.under,
                  heightOfCard: cardHeight,
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
