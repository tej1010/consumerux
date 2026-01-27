
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import 'package:consumer_app/src/screens/portfolio/external_funds_screen.dart';

class PortfolioDetailsScreen extends StatelessWidget {
  const PortfolioDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Total Portfolio'),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExternalFundsScreen(),
                    ),
                  );
                },
                icon: const Icon(LucideIcons.link2, size: 18),
                label: const Text('Link Funds'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              color: AppColors.surface,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderMetric('Invested', currencyFormat.format(150000)),
                      _buildHeaderMetric('Current', currencyFormat.format(165000), valueColor: AppColors.primary),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(height: 1),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderMetric('Total Returns', '+₹15,000', valueColor: AppColors.success),
                      _buildHeaderMetric('XIRR', '18.5%', valueColor: AppColors.success),
                    ],
                  ),
                ],
              ),
            ),
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              tabs: [
                Tab(text: 'Mutual Funds'),
                Tab(text: 'Gold'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildMFList(currencyFormat),
                  _buildGoldList(currencyFormat),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderMetric(String label, String value, {Color? valueColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: valueColor ?? AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildMFList(NumberFormat format) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Indipe Bluechip Equity Fund',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              'Equity • Large Cap',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMetric('Invested', format.format(22500)),
                _buildMetric('Current', format.format(25000)),
                _buildMetric('% Gain', '+11.1%', isGain: true),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildMetric(String label, String value, {bool isGain = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textTertiary),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: isGain ? AppColors.success : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildGoldList(NumberFormat format) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amber.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(LucideIcons.coins, color: Colors.amber),
          ),
          title: const Text(
            'Digital Gold (24K)',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          subtitle: const Text(
            '8.5 gms',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                format.format(53000),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Text(
                '+6.0% Returns',
                style: TextStyle(fontSize: 12, color: AppColors.success),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
