
import 'package:flutter/material.dart';
import 'package:consumer_app/src/constants/app_colors.dart';
import 'package:consumer_app/src/screens/profile/widgets/user_info_card.dart';
import 'package:consumer_app/src/screens/profile/widgets/profile_menu_item.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UserInfoCard(),
            const SizedBox(height: 32),
            _buildSectionHeader('Account Settings'),
            const SizedBox(height: 8),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.border),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(icon: LucideIcons.user, title: 'Personal Details', onTap: () {}),
                  const Divider(height: 1),
                  ProfileMenuItem(icon: LucideIcons.landmark, title: 'Bank Accounts', onTap: () {}),
                  const Divider(height: 1),
                  ProfileMenuItem(icon: LucideIcons.fileText, title: 'Mandates', onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('App Settings'),
            const SizedBox(height: 8),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.border),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(icon: LucideIcons.bell, title: 'Notifications', onTap: () {}),
                  const Divider(height: 1),
                  ProfileMenuItem(icon: LucideIcons.shield, title: 'Security', onTap: () {}),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildSectionHeader('Support & Legal'),
            const SizedBox(height: 8),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.border),
              ),
              child: Column(
                children: [
                  ProfileMenuItem(icon: LucideIcons.helpCircle, title: 'Help & Support', onTap: () {}),
                  const Divider(height: 1),
                  ProfileMenuItem(icon: LucideIcons.fileQuestion, title: 'FAQs', onTap: () {}),
                  const Divider(height: 1),
                  const ProfileMenuItem(icon: LucideIcons.logOut, title: 'Logout', onTap: _f, isDestructive: true),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  color: AppColors.textTertiary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _f() {}

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
