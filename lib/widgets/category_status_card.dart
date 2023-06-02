import 'package:flutter/material.dart';

import '../constants/enums.dart';
import '../utils/string_to_rupee_format.dart';
import 'gradient_box.dart';

class CategoryStatusCard extends StatelessWidget {
  final double heightOfCard;
  final IconData icon;
  final String category;
  final double totalBudget;
  final double spentBudget;
  final MonthlyLimitStatus status;
  const CategoryStatusCard({
    Key? key,
    required this.heightOfCard,
    required this.icon,
    required this.category,
    required this.totalBudget,
    required this.spentBudget,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const height = 150;
    final adjustmentFactor = heightOfCard / height;
    final remainingBudget = (totalBudget - spentBudget).abs();
    final spentRatio = (spentBudget / totalBudget);
    final spentPercentage = spentRatio * 100;
    final heightTillFull = height * spentRatio * adjustmentFactor;
    late final Color colorOfBar;
    late final IconData statusIcon;
    late final RichText richText;
    // late final colorOfRichText;
    switch (status) {
      case MonthlyLimitStatus.crossed:
        colorOfBar = const Color.fromARGB(255, 255, 0, 0);
        statusIcon = Icons.close;
        richText = RichText(
          // You have already crossed the limit by ₹3,000.
          softWrap: true,
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 11 * adjustmentFactor),
            children: <TextSpan>[
              const TextSpan(text: 'You have already crossed the limit by '),
              TextSpan(
                  text: remainingBudget.inRupeesFormat(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorOfBar,
                  )),
            ],
          ),
        );
        break;
      case MonthlyLimitStatus.warning:
        colorOfBar = const Color.fromARGB(255, 255, 183, 0);
        statusIcon = Icons.warning_amber;
        richText = RichText(
          softWrap: true,
          text: TextSpan(
            style:  TextStyle(color: Colors.black, fontSize: 11 * adjustmentFactor),
            children: <TextSpan>[
              TextSpan(
                  text: 'WARNING! ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorOfBar,
                  )),
              const TextSpan(
                  text: 'If you continue spending at this rate, you will '),
              const TextSpan(
                  text: 'exceed the limit ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const TextSpan(text: 'on '),
              const TextSpan(
                  text: '4th ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const TextSpan(text: 'of this month.'),
            ],
          ),
        );
        break;
      case MonthlyLimitStatus.under:
        colorOfBar = const Color.fromARGB(255, 38, 203, 0);
        statusIcon = Icons.check;
        richText = RichText(
          // You are ₹9,900 under the limit.
          softWrap: true,
          text: TextSpan(
            style:  TextStyle(color: Colors.black, fontSize: 11 * adjustmentFactor),
            children: <TextSpan>[
              const TextSpan(text: 'You are '),
              TextSpan(
                  text: remainingBudget.inRupeesFormat(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorOfBar,
                  )),
              const TextSpan(text: ' under the limit.'),
            ],
          ),
        );
        break;
      default:
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomBox(
          height: 150 * adjustmentFactor,
          width: 240 * adjustmentFactor,
          borderRadiusBottomRight: 0,
          borderRadiusTopRight: 0,
          borderRadiusTopLeft: 8 * adjustmentFactor,
          borderRadiusBottomLeft: 8 * adjustmentFactor,
          topLeftColor: const Color.fromARGB(255, 255, 238, 205),
          bottomRightColor: const Color.fromARGB(255, 255, 224, 168),
          borderColor: const Color.fromARGB(255, 252, 192, 87),
          child: Padding(
            padding:  EdgeInsets.all(8.0 * adjustmentFactor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CustomBox(
                      side: 50 * adjustmentFactor,
                      icon: icon,
                    ),
                     SizedBox(
                      width: 10 * adjustmentFactor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style:  TextStyle(
                            color: const Color(0xff323232),
                            fontSize: 19 * adjustmentFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 160 * adjustmentFactor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Text(
                                'Total Budget: ',
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 12 * adjustmentFactor,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                totalBudget.inRupeesFormat(),
                                style:  TextStyle(
                                    color: Colors.brown,
                                    fontSize: 15 * adjustmentFactor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                 SizedBox(
                  height: 5 * adjustmentFactor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          'Spent:',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 12 * adjustmentFactor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          spentBudget.inRupeesFormat(),
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 15 * adjustmentFactor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Remaining: ',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 12 * adjustmentFactor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          (status == MonthlyLimitStatus.crossed)
                              ? '₹0'
                              : remainingBudget.inRupeesFormat(),
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 15 * adjustmentFactor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5 * adjustmentFactor),
                SizedBox(
                  width: 200 * adjustmentFactor,
                  height: 40 * adjustmentFactor,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(statusIcon, size: 18 * adjustmentFactor, color: colorOfBar),
                        SizedBox(width: 5 * adjustmentFactor),
                        SizedBox(
                          width: 180 * adjustmentFactor,
                          child: richText,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            height: 150 * adjustmentFactor,
            width: 40 * adjustmentFactor,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: Color.fromARGB(255, 252, 192, 87)),
                top: BorderSide(color: Color.fromARGB(255, 252, 192, 87)),
                bottom: BorderSide(color: Color.fromARGB(255, 252, 192, 87)),
              ),
              color: Color.fromARGB(255, 255, 232, 189),
            ),
          ),
          Positioned(
            bottom: 1 * adjustmentFactor,
            right: 1 * adjustmentFactor,
            child: Container(
              height: heightTillFull,
              width: (40 - 1) * adjustmentFactor,
              decoration: BoxDecoration(
                color: colorOfBar,
              ),
            ),
          ),
          Positioned(
            bottom: 5 * adjustmentFactor,
            child: Text(
              '${spentPercentage.toInt().toString()}%',
              style:  TextStyle(
                  color: Colors.black,
                  fontSize: 14 * adjustmentFactor,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ]),
      ],
    );
  }
}
