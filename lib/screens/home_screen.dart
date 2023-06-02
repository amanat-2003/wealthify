import 'package:flutter/material.dart';

import '../utils/no_scrolling_effect.dart';
import '../widgets/widgets.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ScrollConfiguration(
      behavior: NoScrollGlowBehaviour(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 12, horizontal: 4 / 100 * screenSize.width),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeCard(width: 92 / 100 * screenSize.width),
              const SizedBox(height: 15),
              const RecentTransactionsPortion(),
              const SizedBox(height: 10),
              const MonthlyTransactionsPortion(),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
