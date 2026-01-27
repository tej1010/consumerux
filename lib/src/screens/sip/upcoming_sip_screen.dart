
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/widgets/primary_button.dart';
import 'package:consumer_app/src/widgets/custom_card.dart';
import 'package:consumer_app/src/screens/sip/mandate_details_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';

class UpcomingSipScreen extends StatelessWidget {
  const UpcomingSipScreen({super.key});

  void _showSIPDetails(BuildContext context, int index, NumberFormat currencyFormat, DateFormat dateFormat) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      'Quant Small Cap Fund',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    currencyFormat.format(5000),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _buildDetailRow(LucideIcons.calendar, 'Next Installment', dateFormat.format(DateTime.now().add(Duration(days: index + 5)))),
              const SizedBox(height: 16),
              _buildDetailRow(LucideIcons.landmark, 'Linked Mandate', 'HDFC Bank (****1234)'),
              const SizedBox(height: 32),
              Row(
                children: [
                   Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(LucideIcons.share2, size: 18),
                      label: const Text('Share Mandate'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: AppColors.border),
                        foregroundColor: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActionItem(
                    icon: LucideIcons.pause,
                    label: 'Pause',
                    color: Colors.orange,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildActionItem(
                    icon: LucideIcons.play,
                    label: 'Resume',
                    color: AppColors.primary,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  _buildActionItem(
                    icon: LucideIcons.trash2,
                    label: 'Cancel',
                    color: AppColors.error,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.textSecondary),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          ],
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);
    final dateFormat = DateFormat('dd MMM, yyyy');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming SIPs'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showSIPDetails(context, index, currencyFormat, dateFormat),
                  child: CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Text(
                                'Quant Small Cap Fund',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            Text(
                              currencyFormat.format(5000),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(LucideIcons.calendar, size: 14, color: AppColors.textSecondary),
                            const SizedBox(width: 8),
                            Text(
                              'Next Installment: ${dateFormat.format(DateTime.now().add(Duration(days: index + 5)))}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(LucideIcons.landmark, size: 14, color: AppColors.textSecondary),
                            const SizedBox(width: 8),
                            const Text(
                              'Linked Mandate: HDFC Bank (****1234)',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: PrimaryButton(
              text: 'Manage Mandates',
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MandateDetailsScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
