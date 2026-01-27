
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/widgets/custom_card.dart';
import 'package:consumer_app/src/widgets/primary_button.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GoldInvestTab extends StatelessWidget {
  const GoldInvestTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCard(
            color: const Color(0xFFFFFBEB), // Amber 50
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Live Gold Price',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF92400E), // Amber 800
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '₹6,250 / gm',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB45309), // Amber 700
                      ),
                    ),
                  ],
                ),
                const Icon(
                  LucideIcons.coins,
                  size: 40,
                  color: Color(0xFFF59E0B),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Invest in Digital Gold',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '99.99% Pure Gold • Secure Storage • Easy Liquidity',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Sell Gold'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(
                  text: 'Buy Gold',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
