
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:intl/intl.dart';

enum TransactionStatus { success, pending, failed }

class TransactionItem extends StatelessWidget {
  final String type;
  final double amount;
  final DateTime date;
  final TransactionStatus status;
  final String referenceId;
  final VoidCallback onTap;

  const TransactionItem({
    super.key,
    required this.type,
    required this.amount,
    required this.date,
    required this.status,
    required this.referenceId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final dateFormat = DateFormat('MMM dd, yyyy • hh:mm a');

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: AppColors.background,
        child: Icon(
          _getIcon(type),
          color: AppColors.textPrimary,
          size: 20,
        ),
      ),
      title: Text(
        type,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Text(
            dateFormat.format(date),
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            status.name.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: _getStatusColor(status),
            ),
          ),
        ],
      ),
      trailing: Text(
        currencyFormat.format(amount),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  IconData _getIcon(String type) {
    if (type.contains('MF')) return LucideIcons.trendingUp;
    if (type.contains('Bill')) return LucideIcons.receipt;
    if (type.contains('UPI')) return LucideIcons.indianRupee;
    return LucideIcons.arrowRightLeft;
  }

  Color _getStatusColor(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.success:
        return AppColors.success;
      case TransactionStatus.pending:
        return AppColors.warning;
      case TransactionStatus.failed:
        return AppColors.error;
    }
  }
}
