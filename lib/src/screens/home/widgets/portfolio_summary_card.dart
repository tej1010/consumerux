
import 'package:flutter/material.dart';
import 'package:consumer_app/src/screens/portfolio/portfolio_details_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/widgets/custom_card.dart';
import 'package:intl/intl.dart';

class PortfolioSummaryCard extends StatefulWidget {
  const PortfolioSummaryCard({super.key});

  @override
  State<PortfolioSummaryCard> createState() => _PortfolioSummaryCardState();
}

class _PortfolioSummaryCardState extends State<PortfolioSummaryCard> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomCard(
        color: AppColors.primary,
        padding: const EdgeInsets.all(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PortfolioDetailsScreen()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Invested Amount',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => _isVisible = !_isVisible),
                  child: Icon(
                    _isVisible ? LucideIcons.eye : LucideIcons.eyeOff,
                    color: Colors.white.withValues(alpha: 0.8),
                    size: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _isVisible ? currencyFormat.format(150000) : '₹ ••••••',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn('Current Value', 165000, currencyFormat),
                _buildInfoColumn('Overall Gain', 15000, currencyFormat, isGain: true, percentage: 10.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, double value, NumberFormat format, {bool isGain = false, double? percentage}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.8),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              _isVisible ? format.format(value) : '••••••',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isGain && _isVisible && percentage != null) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '+$percentage%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
