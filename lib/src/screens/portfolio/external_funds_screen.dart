import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:intl/intl.dart';

class ExternalFundsScreen extends StatefulWidget {
  const ExternalFundsScreen({super.key});

  @override
  State<ExternalFundsScreen> createState() => _ExternalFundsScreenState();
}

class _ExternalFundsScreenState extends State<ExternalFundsScreen> {
  String selectedTab = 'all'; // 'all', 'system', 'external'
  bool isFetchingFunds = false;
  List<ExternalFund> externalFunds = [];
  List<SystemHolding> systemHoldings = [];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    // Initialize with sample system holdings
    systemHoldings = [
      SystemHolding(
        id: '1',
        name: 'Quant Small Cap',
        category: 'Equity • Small Cap',
        invested: 50000,
        current: 56000,
        returnPercentage: 12.0,
        unit: 25.5,
      ),
      SystemHolding(
        id: '2',
        name: 'HDFC Mid-Cap Opportunities',
        category: 'Equity • Mid Cap',
        invested: 75000,
        current: 82000,
        returnPercentage: 9.3,
        unit: 45.2,
      ),
      SystemHolding(
        id: '3',
        name: 'ICICI Prudential Tech',
        category: 'Equity • Sectoral',
        invested: 25000,
        current: 28500,
        returnPercentage: 14.0,
        unit: 15.8,
      ),
    ];
  }

  Future<void> _fetchExternalFunds() async {
    setState(() {
      isFetchingFunds = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      externalFunds = [
        ExternalFund(
          id: 'ext_1',
          name: 'Vanguard S&P 500',
          category: 'International • Equity',
          invested: 100000,
          current: 112000,
          returnPercentage: 12.0,
          unit: 65.4,
          source: 'External Broker',
        ),
        ExternalFund(
          id: 'ext_2',
          name: 'ICICI Bluechip',
          category: 'Equity • Large Cap',
          invested: 50000,
          current: 54500,
          returnPercentage: 9.0,
          unit: 35.2,
          source: 'Direct Holdings',
        ),
        ExternalFund(
          id: 'ext_3',
          name: 'SBI Liquid Fund',
          category: 'Debt • Liquid',
          invested: 30000,
          current: 31200,
          returnPercentage: 4.0,
          unit: 10.5,
          source: 'External Broker',
        ),
      ];
      isFetchingFunds = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('External funds fetched successfully!'),
        backgroundColor: AppColors.primary,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0);

    final allHoldings = _getAllHoldings();
    final filteredHoldings = _getFilteredHoldings();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Holdings'),
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
            // Summary Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, Color(0xFF6FBAFC)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Holdings Value',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currencyFormat.format(
                      allHoldings.fold<double>(
                        0,
                        (sum, item) => sum + item.current,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Invested',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            currencyFormat.format(
                              allHoldings.fold<double>(
                                0,
                                (sum, item) => sum + item.invested,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'System Holdings',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${systemHoldings.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6FBAFC),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'External Holdings',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${externalFunds.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6FBAFC),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Fetch External Funds Button
            if (externalFunds.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  onPressed: isFetchingFunds ? null : _fetchExternalFunds,
                  icon: isFetchingFunds
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Icon(LucideIcons.download),
                  label: Text(
                    isFetchingFunds ? 'Fetching...' : 'Fetch External Funds',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

            // Tab Selection
            if (externalFunds.isNotEmpty) ...[
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _buildFilterTab('All', 'all', allHoldings.length),
                    const SizedBox(width: 12),
                    _buildFilterTab('System', 'system', systemHoldings.length),
                    const SizedBox(width: 12),
                    _buildFilterTab(
                        'External', 'external', externalFunds.length),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 20),

            // Holdings List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (filteredHoldings.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Icon(
                              LucideIcons.inbox,
                              size: 48,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'No holdings to display',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ...filteredHoldings.asMap().entries.map((entry) {
                      final index = entry.key;
                      final holding = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: index < filteredHoldings.length - 1 ? 12 : 0,
                        ),
                        child: _buildHoldingCard(holding, currencyFormat),
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

  Widget _buildFilterTab(String label, String value, int count) {
    final isSelected = selectedTab == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  isSelected ? AppColors.primary : AppColors.border,
              width: 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHoldingCard(dynamic holding, NumberFormat format) {
    final isExternal = holding is ExternalFund;
    final name = holding.name;
    final category = holding.category;
    final invested = holding.invested;
    final current = holding.current;
    final returnValue = current - invested;
    final returnPercentage = holding.returnPercentage;
    final source = isExternal ? holding.source : 'System';

    final isPositive = returnValue >= 0;
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
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isExternal ? const Color(0xFFD06978).withValues(alpha: 0.1)
                      : AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  source,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: isExternal ? const Color(0xFFD06978) : AppColors.primary,
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
                    'Invested',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    format.format(invested),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Current',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    format.format(current),
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
                  Text(
                    'Return',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '+${format.format(returnValue)}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Return %',
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '+${returnPercentage.toStringAsFixed(2)}%',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<dynamic> _getAllHoldings() {
    return [...systemHoldings, ...externalFunds];
  }

  List<dynamic> _getFilteredHoldings() {
    if (selectedTab == 'system') {
      return systemHoldings;
    } else if (selectedTab == 'external') {
      return externalFunds;
    } else {
      return _getAllHoldings();
    }
  }
}

class SystemHolding {
  final String id;
  final String name;
  final String category;
  final double invested;
  final double current;
  final double returnPercentage;
  final double unit;

  SystemHolding({
    required this.id,
    required this.name,
    required this.category,
    required this.invested,
    required this.current,
    required this.returnPercentage,
    required this.unit,
  });
}

class ExternalFund {
  final String id;
  final String name;
  final String category;
  final double invested;
  final double current;
  final double returnPercentage;
  final double unit;
  final String source;

  ExternalFund({
    required this.id,
    required this.name,
    required this.category,
    required this.invested,
    required this.current,
    required this.returnPercentage,
    required this.unit,
    required this.source,
  });
}
