
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/screens/invest/widgets/mutual_funds_tab.dart';
import 'package:consumer_app/src/screens/invest/widgets/gold_invest_tab.dart';

class InvestScreen extends StatelessWidget {
  const InvestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Invest'),
          bottom: const TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Mutual Funds'),
              Tab(text: 'Gold'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MutualFundsTab(),
            GoldInvestTab(),
          ],
        ),
      ),
    );
  }
}
