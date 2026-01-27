
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/widgets/custom_card.dart';

class BillPaymentGrid extends StatelessWidget {
  const BillPaymentGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bill Payments',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.9,
          children: [
            _buildBillItem('Electricity', LucideIcons.zap, context, lastPaid: '20 Jul'),
            _buildBillItem('Mobile', LucideIcons.smartphone, context, lastPaid: '15 Jul'),
            _buildBillItem('Broadband', LucideIcons.wifi, context),
            _buildBillItem('DTH', LucideIcons.tv, context),
            _buildBillItem('Gas', LucideIcons.flame, context),
            _buildBillItem('More', LucideIcons.grid, context),
          ],
        ),
      ],
    );
  }

  Widget _buildBillItem(String label, IconData icon, BuildContext context, {String? lastPaid}) {
    return CustomCard(
      padding: const EdgeInsets.all(8),
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          if (lastPaid != null) ...[
            const SizedBox(height: 4),
            Text(
              'Paid $lastPaid',
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.success,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
