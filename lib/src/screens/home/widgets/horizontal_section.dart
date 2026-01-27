
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';

class HorizontalSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final VoidCallback? onViewAll;

  const HorizontalSection({
    super.key,
    required this.title,
    required this.children,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              if (onViewAll != null)
                GestureDetector(
                  onTap: onViewAll,
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180, // Height to accommodate HomeFundCard
          child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 8),
            scrollDirection: Axis.horizontal,
            children: children,
          ),
        ),
      ],
    );
  }
}
