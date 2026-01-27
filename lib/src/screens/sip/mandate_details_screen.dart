
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/widgets/primary_button.dart';
import 'package:consumer_app/src/widgets/custom_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MandateDetailsScreen extends StatelessWidget {
  const MandateDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Mandates'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  'Active Mandates',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                _buildMandateCard(
                  bankName: 'HDFC Bank',
                  accNumber: 'XXXX 1234',
                  limit: 50000,
                  status: 'Active',
                ),
                const SizedBox(height: 12),
                _buildMandateCard(
                  bankName: 'ICICI Bank',
                  accNumber: 'XXXX 5678',
                  limit: 25000,
                  status: 'Active',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PrimaryButton(
              text: 'Add New Mandate',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMandateCard({
    required String bankName,
    required String accNumber,
    required double limit,
    required String status,
  }) {
    return CustomCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(LucideIcons.landmark, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bankName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  accNumber,
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  'Limit: ₹$limit',
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.success.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: const TextStyle(
                color: AppColors.success,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
