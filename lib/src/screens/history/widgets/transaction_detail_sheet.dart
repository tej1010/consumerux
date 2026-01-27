
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/screens/history/widgets/transaction_item.dart';
import 'package:consumer_app/src/widgets/primary_button.dart';
import 'package:intl/intl.dart';

class TransactionDetailSheet extends StatelessWidget {
  final String type;
  final double amount;
  final DateTime date;
  final TransactionStatus status;
  final String referenceId;

  const TransactionDetailSheet({
    super.key,
    required this.type,
    required this.amount,
    required this.date,
    required this.status,
    required this.referenceId,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final dateFormat = DateFormat('MMM dd, yyyy • hh:mm a');

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          CircleAvatar(
            radius: 30,
            backgroundColor: _getStatusColor(status).withValues(alpha: 0.1),
            child: Icon(
              _getStatusIcon(status),
              color: _getStatusColor(status),
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            currencyFormat.format(amount),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          Text(
            'Payment ${status.name}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _getStatusColor(status),
            ),
          ),
          const SizedBox(height: 32),
          _buildDetailRow('Transaction ID', referenceId),
          _buildDetailRow('Date & Time', dateFormat.format(date)),
          _buildDetailRow('Type', type),
          const SizedBox(height: 32),
          PrimaryButton(
            text: 'Download Receipt',
            onTap: () {}, // UI Only
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
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

  IconData _getStatusIcon(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.success:
        return LucideIcons.check;
      case TransactionStatus.pending:
        return LucideIcons.clock;
      case TransactionStatus.failed:
        return LucideIcons.x;
    }
  }
}
