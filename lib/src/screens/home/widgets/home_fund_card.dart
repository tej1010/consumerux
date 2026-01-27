
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/widgets/custom_card.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeFundCard extends StatelessWidget {
  final String title;
  final String category;
  final double returnPercentage;
  final String? subtitle; // e.g., "3Y Returns"
  final VoidCallback? onTap;

  const HomeFundCard({
    super.key,
    required this.title,
    required this.category,
    required this.returnPercentage,
    this.subtitle = '3Y Returns',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      child: CustomCard(
        onTap: onTap,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(LucideIcons.barChart3, color: AppColors.primary, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: AppColors.textPrimary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              category,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  '$returnPercentage%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.success,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(LucideIcons.arrowUp, size: 12, color: AppColors.success),
              ],
            ),
            Text(
              subtitle!,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
