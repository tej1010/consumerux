
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';

class FilterChipBar extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final Function(String) onSelected;

  const FilterChipBar({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onSelected,
  });

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
            onSelected: (_) => onSelected(filter),
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.surface,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppColors.textPrimary,
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
