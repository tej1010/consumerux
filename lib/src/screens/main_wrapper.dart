
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/screens/home/home_screen.dart';
import 'package:consumer_app/src/screens/history/history_screen.dart';
import 'package:consumer_app/src/screens/pay/pay_screen.dart';
import 'package:consumer_app/src/screens/invest/invest_screen.dart';
import 'package:consumer_app/src/screens/profile/profile_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    HistoryScreen(),
    PayScreen(),
    InvestScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.indianRupee),
              label: 'Pay',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.trendingUp),
              label: 'Invest',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
