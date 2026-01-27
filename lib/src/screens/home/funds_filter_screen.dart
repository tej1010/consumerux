import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:intl/intl.dart';

class FundsFilterScreen extends StatelessWidget {
  final String fundCategory;
  final String fundCategoryTitle;

  const FundsFilterScreen({
    super.key,
    required this.fundCategory,
    required this.fundCategoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    final fundsList = _getFundsByCategory();

    return Scaffold(
      appBar: AppBar(
        title: Text(fundCategoryTitle),
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Category Header
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, const Color(0xFF6FBAFC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fundCategoryTitle,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${fundsList.length} Funds Available',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          LucideIcons.trendingUp,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Avg Return: ${_getAverageReturn()}%',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Funds List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Available Funds',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...fundsList.asMap().entries.map((entry) {
                    final index = entry.key;
                    final fund = entry.value;
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: index < fundsList.length - 1 ? 12 : 0,
                      ),
                      child: _buildFundCard(fund, currencyFormat),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildFundCard(FundItem fund, NumberFormat format) {
    final isPositive = fund.returnPercentage >= 0;
    final color = isPositive ? const Color(0xFF6FBAFC) : const Color(0xFFD06978);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fund.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      fund.category,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '+${fund.returnPercentage.toStringAsFixed(2)}%',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fund.returnLabel,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '+${fund.returnPercentage.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Expense Ratio',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${fund.expenseRatio}%',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'AUM',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '₹${fund.aum}Cr',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Invest Now',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<FundItem> _getFundsByCategory() {
    switch (fundCategory) {
      case 'debt':
        return [
          FundItem(
            name: 'Aditya Birla SL Liquid',
            category: 'Debt • Liquid',
            returnPercentage: 7.2,
            returnLabel: 'Returns up to',
            expenseRatio: 0.45,
            aum: 25000,
          ),
          FundItem(
            name: 'HDFC Low Duration',
            category: 'Debt • Low Duration',
            returnPercentage: 7.5,
            returnLabel: 'Returns up to',
            expenseRatio: 0.55,
            aum: 15000,
          ),
          FundItem(
            name: 'ICICI Pru Savings',
            category: 'Debt • Low Duration',
            returnPercentage: 7.4,
            returnLabel: 'Returns up to',
            expenseRatio: 0.50,
            aum: 12000,
          ),
          FundItem(
            name: 'Axis Short Term',
            category: 'Debt • Short Duration',
            returnPercentage: 8.1,
            returnLabel: 'Returns up to',
            expenseRatio: 0.60,
            aum: 8000,
          ),
        ];
      case 'growth':
        return [
          FundItem(
            name: 'Parag Parikh Flexi Cap',
            category: 'Equity • Flexi Cap',
            returnPercentage: 22.1,
            returnLabel: '5Y Returns',
            expenseRatio: 0.70,
            aum: 45000,
          ),
          FundItem(
            name: 'Canara Robeco Bluechip',
            category: 'Equity • Large Cap',
            returnPercentage: 15.4,
            returnLabel: '5Y Returns',
            expenseRatio: 0.65,
            aum: 32000,
          ),
          FundItem(
            name: 'Axis Bluechip Fund',
            category: 'Equity • Large Cap',
            returnPercentage: 14.8,
            returnLabel: '5Y Returns',
            expenseRatio: 0.70,
            aum: 28000,
          ),
          FundItem(
            name: 'HDFC Growth Fund',
            category: 'Equity • Multi Cap',
            returnPercentage: 18.5,
            returnLabel: '5Y Returns',
            expenseRatio: 0.75,
            aum: 52000,
          ),
        ];
      case 'equity':
        return [
          FundItem(
            name: 'Quant Small Cap',
            category: 'Equity • Small Cap',
            returnPercentage: 45.2,
            returnLabel: '3Y Returns',
            expenseRatio: 0.85,
            aum: 18000,
          ),
          FundItem(
            name: 'Nippon India Small Cap',
            category: 'Equity • Small Cap',
            returnPercentage: 38.5,
            returnLabel: '3Y Returns',
            expenseRatio: 0.90,
            aum: 22000,
          ),
          FundItem(
            name: 'HDFC Mid-Cap Opportunities',
            category: 'Equity • Mid Cap',
            returnPercentage: 28.1,
            returnLabel: '3Y Returns',
            expenseRatio: 0.80,
            aum: 35000,
          ),
          FundItem(
            name: 'ICICI Prudential Tech',
            category: 'Equity • Sectoral',
            returnPercentage: 18.5,
            returnLabel: '1Y Returns',
            expenseRatio: 0.95,
            aum: 15000,
          ),
        ];
      case 'new':
        return [
          FundItem(
            name: 'Motilal Oswal India Consumption',
            category: 'Equity • Thematic',
            returnPercentage: 12.5,
            returnLabel: '1Y Returns',
            expenseRatio: 1.00,
            aum: 5000,
          ),
          FundItem(
            name: 'SBI Overnight Fund',
            category: 'Debt • Overnight',
            returnPercentage: 6.8,
            returnLabel: 'Returns up to',
            expenseRatio: 0.25,
            aum: 3000,
          ),
          FundItem(
            name: 'Kotak Emerging Equity',
            category: 'Equity • Mid Cap',
            returnPercentage: 16.2,
            returnLabel: '2Y Returns',
            expenseRatio: 0.85,
            aum: 4500,
          ),
          FundItem(
            name: 'UTI ESG Fund',
            category: 'Equity • ESG',
            returnPercentage: 14.8,
            returnLabel: '1Y Returns',
            expenseRatio: 0.92,
            aum: 2800,
          ),
        ];
      default:
        return [];
    }
  }

  double _getAverageReturn() {
    final funds = _getFundsByCategory();
    if (funds.isEmpty) return 0;
    final sum = funds.fold<double>(
        0, (previousValue, element) => previousValue + element.returnPercentage);
    return sum / funds.length;
  }
}

class FundItem {
  final String name;
  final String category;
  final double returnPercentage;
  final String returnLabel;
  final double expenseRatio;
  final int aum;

  FundItem({
    required this.name,
    required this.category,
    required this.returnPercentage,
    required this.returnLabel,
    required this.expenseRatio,
    required this.aum,
  });
}
