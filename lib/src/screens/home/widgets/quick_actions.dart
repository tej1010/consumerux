
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/screens/sip/upcoming_sip_screen.dart';
import 'package:consumer_app/src/screens/orders/orders_screen.dart';
import 'package:consumer_app/src/screens/performance/performance_screen.dart';
import 'package:consumer_app/src/screens/portfolio/external_funds_screen.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildActionItem(context, 'Invest Now', LucideIcons.trendingUp, AppColors.primary, () {}),
                const SizedBox(width: 16),
                _buildActionItem(context, 'Pay Bill', LucideIcons.receipt, AppColors.secondary, () {}),
                const SizedBox(width: 16),
                _buildActionItem(context, 'Add Money', LucideIcons.plus, AppColors.info, () {}),
                const SizedBox(width: 16),
                _buildActionItem(context, 'Performance', LucideIcons.barChart3, Colors.teal, () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PerformanceScreen()),
                  );
                }),
                const SizedBox(width: 16),
                _buildActionItem(context, 'Link Funds', LucideIcons.link2, AppColors.secondary, () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExternalFundsScreen()),
                  );
                }),
                const SizedBox(width: 16),
                _buildActionItem(context, 'Upcoming SIP', LucideIcons.calendarClock, Colors.orange, () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UpcomingSipScreen()),
                  );
                }),
                const SizedBox(width: 16),
                _buildActionItem(context, 'Orders', LucideIcons.shoppingBag, Colors.purple, () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OrdersScreen()),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, String label, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
