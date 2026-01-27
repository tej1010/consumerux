
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/screens/home/widgets/home_header.dart';
import 'package:consumer_app/src/screens/home/widgets/portfolio_summary_card.dart';
import 'package:consumer_app/src/screens/home/widgets/investment_card.dart';
import 'package:consumer_app/src/screens/home/widgets/quick_actions.dart';
import 'package:consumer_app/src/screens/home/widgets/horizontal_section.dart';
import 'package:consumer_app/src/screens/home/widgets/home_fund_card.dart';
import 'package:consumer_app/src/screens/home/widgets/proposal_card.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/screens/home/funds_filter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const PortfolioSummaryCard(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Investments',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 180, // Height for InvestmentCard
                child: ListView(
                  padding: const EdgeInsets.only(left: 20, right: 8),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    InvestmentCard(
                      title: 'Mutual Funds',
                      amount: 100000,
                      currentValue: 112000,
                      dayChange: 1.2,
                      isGold: false,
                    ),
                    InvestmentCard(
                      title: 'Digital Gold',
                      amount: 50000,
                      currentValue: 53000,
                      goldUnits: 8.5,
                      isGold: true,
                    ),
                    InvestmentCard(
                      title: 'Sovereign Bond',
                      amount: 25000,
                      currentValue: 26000,
                      dayChange: 0.5,
                      isGold: false,
                    ),
                  ],
                ),
              ),
              const QuickActions(),
              const SizedBox(height: 24),

              // Proposals Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommended Proposals',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Pre-built investment plans tailored for you',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Proposal 1: Conservative Growth
              ProposalCard(
                proposalTitle: 'Conservative Growth',
                description: 'Balanced portfolio for steady growth',
                funds: [
                  ProposalFund(
                    name: 'ICICI Pru Savings Fund',
                    category: 'Debt • Low Duration',
                    expenseRatio: 0.65,
                    aum: 12500,
                    returns: 7.2,
                    timeframe: '1Y Return',
                  ),
                  ProposalFund(
                    name: 'Axis Bluechip Fund',
                    category: 'Equity • Large Cap',
                    expenseRatio: 0.58,
                    aum: 32500,
                    returns: 14.8,
                    timeframe: '5Y Return',
                  ),
                  ProposalFund(
                    name: 'HDFC Balanced Advantage',
                    category: 'Equity • Balanced',
                    expenseRatio: 0.72,
                    aum: 18200,
                    returns: 12.5,
                    timeframe: '5Y Return',
                  ),
                ],
                allocation: '40% Debt, 60% Equity',
                expectedReturn: 10.2,
              ),

              // Proposal 2: Aggressive Growth
              ProposalCard(
                proposalTitle: 'Aggressive Growth',
                description: 'High growth portfolio for long-term investors',
                funds: [
                  ProposalFund(
                    name: 'Quant Small Cap Fund',
                    category: 'Equity • Small Cap',
                    expenseRatio: 0.45,
                    aum: 8500,
                    returns: 45.2,
                    timeframe: '3Y Return',
                  ),
                  ProposalFund(
                    name: 'Parag Parikh Flexi Cap',
                    category: 'Equity • Flexi Cap',
                    expenseRatio: 0.51,
                    aum: 45200,
                    returns: 22.1,
                    timeframe: '5Y Return',
                  ),
                  ProposalFund(
                    name: 'ICICI Prudential Tech',
                    category: 'Equity • Sectoral',
                    expenseRatio: 0.68,
                    aum: 9800,
                    returns: 18.5,
                    timeframe: '1Y Return',
                  ),
                ],
                allocation: '100% Equity',
                expectedReturn: 28.6,
              ),

              // Proposal 3: Tax Planning
              ProposalCard(
                proposalTitle: 'Tax Planning Portfolio',
                description: 'Optimized for tax savings with ELSS funds',
                funds: [
                  ProposalFund(
                    name: 'Mirae Asset Tax Saver',
                    category: 'Equity • ELSS',
                    expenseRatio: 0.61,
                    aum: 15600,
                    returns: 18.2,
                    timeframe: '3Y Return',
                  ),
                  ProposalFund(
                    name: 'Kotak Tax Saver',
                    category: 'Equity • ELSS',
                    expenseRatio: 0.54,
                    aum: 22300,
                    returns: 17.5,
                    timeframe: '3Y Return',
                  ),
                  ProposalFund(
                    name: 'Axis Liquid Fund',
                    category: 'Debt • Liquid',
                    expenseRatio: 0.42,
                    aum: 28900,
                    returns: 6.8,
                    timeframe: '1Y Return',
                  ),
                ],
                allocation: '70% Equity (ELSS), 30% Liquid',
                expectedReturn: 14.8,
              ),

              const SizedBox(height: 24),
              
              // 1. Recently Viewed MF
              const HorizontalSection(
                title: 'Recently Viewed MF',
                children: [
                   HomeFundCard(title: 'Quant Small Cap', category: 'Equity • Small Cap', returnPercentage: 45.2, subtitle: '3Y Returns'),
                   HomeFundCard(title: 'Nippon India Small Cap', category: 'Equity • Small Cap', returnPercentage: 38.5, subtitle: '3Y Returns'),
                   HomeFundCard(title: 'HDFC Mid-Cap Opportunities', category: 'Equity • Mid Cap', returnPercentage: 28.1, subtitle: '3Y Returns'),
                ],
              ),
              const SizedBox(height: 24),

              // 2. High Return Funds
              const HorizontalSection(
                title: 'High Return Funds',
                children: [
                   HomeFundCard(title: 'ICICI Prudential Tech', category: 'Equity • Sectoral', returnPercentage: 18.5, subtitle: '1Y Returns'),
                   HomeFundCard(title: 'Tata Digital India', category: 'Equity • Sectoral', returnPercentage: 16.2, subtitle: '1Y Returns'),
                   HomeFundCard(title: 'SBI Technology Opps', category: 'Equity • Sectoral', returnPercentage: 15.8, subtitle: '1Y Returns'),
                ],
              ),
              const SizedBox(height: 24),

              // 3. Tax Savers (ELSS)
              const HorizontalSection(
                title: 'Tax Savers (ELSS)',
                children: [
                   HomeFundCard(title: 'Mirae Asset Tax Saver', category: 'Equity • ELSS', returnPercentage: 18.2, subtitle: '3Y Returns'),
                   HomeFundCard(title: 'Kotak Tax Saver', category: 'Equity • ELSS', returnPercentage: 17.5, subtitle: '3Y Returns'),
                   HomeFundCard(title: 'DSP Tax Saver', category: 'Equity • ELSS', returnPercentage: 16.9, subtitle: '3Y Returns'),
                ],
              ),
              const SizedBox(height: 24),

              // 4. Our Choice
              const HorizontalSection(
                title: 'Our Choice',
                children: [
                   HomeFundCard(title: 'Parag Parikh Flexi Cap', category: 'Equity • Flexi Cap', returnPercentage: 22.1, subtitle: '5Y Returns'),
                   HomeFundCard(title: 'Canara Robeco Bluechip', category: 'Equity • Large Cap', returnPercentage: 15.4, subtitle: '5Y Returns'),
                   HomeFundCard(title: 'Axis Bluechip Fund', category: 'Equity • Large Cap', returnPercentage: 14.8, subtitle: '5Y Returns'),
                ],
              ),
              const SizedBox(height: 24),

               // 5. Alternate to FD
              const HorizontalSection(
                title: 'Alternate to FD',
                children: [
                   HomeFundCard(title: 'Aditya Birla SL Liquid', category: 'Debt • Liquid', returnPercentage: 7.2, subtitle: 'Returns up to'),
                   HomeFundCard(title: 'HDFC Low Duration', category: 'Debt • Low Duration', returnPercentage: 7.5, subtitle: 'Returns up to'),
                   HomeFundCard(title: 'ICICI Pru Savings', category: 'Debt • Low Duration', returnPercentage: 7.4, subtitle: 'Returns up to'),
                ],
              ),
              const SizedBox(height: 32),

              // Fund Category Filters
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Browse by Category',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.0,
                      children: [
                        _buildCategoryButton(
                          context,
                          'Debt Funds',
                          LucideIcons.shield,
                          AppColors.primary,
                          'debt',
                        ),
                        _buildCategoryButton(
                          context,
                          'Growth Funds',
                          LucideIcons.trendingUp,
                          AppColors.secondary,
                          'growth',
                        ),
                        _buildCategoryButton(
                          context,
                          'Equity Funds',
                          LucideIcons.barChart3,
                          Colors.teal,
                          'equity',
                        ),
                        _buildCategoryButton(
                          context,
                          'New Funds',
                          LucideIcons.sparkles,
                          Colors.orange,
                          'new',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    String category,
  ) {
    final categoryTitles = {
      'debt': 'Debt Funds',
      'growth': 'Growth Funds',
      'equity': 'Equity Funds',
      'new': 'New Funds',
    };

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FundsFilterScreen(
              fundCategory: category,
              fundCategoryTitle: categoryTitles[category] ?? label,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withValues(alpha: 0.8),
              color.withValues(alpha: 0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
