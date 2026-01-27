
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/screens/invest/widgets/fund_card.dart';
import 'package:consumer_app/src/widgets/filter_chip_bar.dart';

class MutualFundsTab extends StatefulWidget {
  const MutualFundsTab({super.key});

  @override
  State<MutualFundsTab> createState() => _MutualFundsTabState();
}

class _MutualFundsTabState extends State<MutualFundsTab> {
  String _selectedCategory = 'All';
  String _selectedRisk = 'All Risks';

  final List<String> _categories = const ['All', 'Equity', 'Debt', 'Hybrid', 'ELSS'];
  final List<String> _risks = const ['All Risks', 'Low', 'Medium', 'High'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        FilterChipBar(
          filters: _categories,
          selectedFilter: _selectedCategory,
          onSelected: (val) => setState(() => _selectedCategory = val),
        ),
        const SizedBox(height: 12),
        FilterChipBar(
          filters: _risks,
          selectedFilter: _selectedRisk,
          onSelected: (val) => setState(() => _selectedRisk = val),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildSectionHeader('Top Rated Funds'),
              const SizedBox(height: 16),
              const FundCard(
                fundName: 'Indipe Bluechip Equity Fund',
                category: 'Equity • Large Cap',
                risk: 'High',
                returnPercentage: 22.5,
              ),
              const SizedBox(height: 12),
              const FundCard(
                fundName: 'Indipe Flexi Cap Fund',
                category: 'Equity • Flexi Cap',
                risk: 'Medium',
                returnPercentage: 18.2,
              ),
              const SizedBox(height: 24),
              _buildSectionHeader('Debt Funds'),
              const SizedBox(height: 16),
              const FundCard(
                fundName: 'Indipe Liquid Fund',
                category: 'Debt • Liquid',
                risk: 'Low',
                returnPercentage: 7.1,
              ),
              const SizedBox(height: 12),
              const FundCard(
                fundName: 'Indipe Corporate Bond Fund',
                category: 'Debt • Corporate Bond',
                risk: 'Low',
                returnPercentage: 8.5,
              ),
               const SizedBox(height: 24),
               _buildSectionHeader('New Fund Offers (NFO)'),
               const SizedBox(height: 16),
               const FundCard(
                fundName: 'Indipe Tech Innovation Fund',
                category: 'Equity • Sectoral',
                risk: 'Very High',
                returnPercentage: 0.0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }
}
