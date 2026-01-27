
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';

class HistoryFilterBar extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;

  const HistoryFilterBar({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
  });

  final List<String> filters = const ['All', 'Investments', 'Payments', 'UPI'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;
          return ChoiceChip(
            label: Text(filter),
            selected: isSelected,
            onSelected: (_) => onFilterSelected(filter),
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.background,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.border,
              ),
            ),
            showCheckmark: false,
          );
        },
      ),
    );
  }
}
