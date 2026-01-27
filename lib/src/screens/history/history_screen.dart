
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/screens/history/widgets/history_filter_bar.dart';
import 'package:consumer_app/src/screens/history/widgets/transaction_item.dart';
import 'package:consumer_app/src/screens/history/widgets/transaction_detail_sheet.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  String _selectedFilter = 'All';

  // Mock Data
  final List<Map<String, dynamic>> _transactions = [
    {
      'type': 'MF Buy',
      'amount': 5000.0,
      'date': DateTime.now().subtract(const Duration(minutes: 30)),
      'status': TransactionStatus.success,
      'id': 'TXN123456789',
    },
    {
      'type': 'Electric Bill',
      'amount': 1250.0,
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'status': TransactionStatus.success,
      'id': 'TXN987654321',
    },
    {
      'type': 'UPI Transfer',
      'amount': 500.0,
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'status': TransactionStatus.pending,
      'id': 'UPI555666777',
    },
    {
      'type': 'Gold Buy',
      'amount': 2000.0,
      'date': DateTime.now().subtract(const Duration(days: 5)),
      'status': TransactionStatus.failed,
      'id': 'GLD111222333',
    },
    {
      'type': 'SIP Auto-Debit',
      'amount': 2500.0,
      'date': DateTime.now().subtract(const Duration(days: 10)),
      'status': TransactionStatus.success,
      'id': 'SIP999888777',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: Column(
        children: [
          HistoryFilterBar(
            selectedFilter: _selectedFilter,
            onFilterSelected: (filter) {
              setState(() {
                _selectedFilter = filter;
              });
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: 10, // Mock infinite scroll feel
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                indent: 20,
                endIndent: 20,
                color: AppColors.border,
              ),
              itemBuilder: (context, index) {
                // Repeating the mock data for UI feel
                final transaction = _transactions[index % _transactions.length];
                return TransactionItem(
                  type: transaction['type'],
                  amount: transaction['amount'],
                  date: transaction['date'],
                  status: transaction['status'],
                  referenceId: transaction['id'],
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => TransactionDetailSheet(
                        type: transaction['type'],
                        amount: transaction['amount'],
                        date: transaction['date'],
                        status: transaction['status'],
                        referenceId: transaction['id'],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
