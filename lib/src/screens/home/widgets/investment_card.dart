
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/widgets/custom_card.dart';
import 'package:intl/intl.dart';

class InvestmentCard extends StatelessWidget {
  final String title;
  final double amount;
  final double currentValue;
  final double? dayChange;
  final bool isGold;
  final double? goldUnits;

  const InvestmentCard({
    super.key,
    required this.title,
    required this.amount,
    required this.currentValue,
    this.dayChange,
    this.isGold = false,
    this.goldUnits,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: CustomCard(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isGold ? LucideIcons.coins : LucideIcons.trendingUp,
                  color: isGold ? AppColors.warning : AppColors.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Current Value',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              currencyFormat.format(currentValue),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            if (isGold)
              Text(
                '${goldUnits}g',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            else
              Row(
                children: [
                  Icon(
                    dayChange! >= 0 ? LucideIcons.arrowUp : LucideIcons.arrowDown,
                    size: 14,
                    color: dayChange! >= 0 ? AppColors.success : AppColors.error,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${dayChange!.abs()}%',
                    style: TextStyle(
                      color: dayChange! >= 0 ? AppColors.success : AppColors.error,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
