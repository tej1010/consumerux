
import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF305BF3); // Ultramarine Blue
  static const Color primaryDark = Color(0xFF2447C4); // Darker Ultramarine
  static const Color primaryLight = Color(0xFF6FBAFC); // Very Light Azure

  // Secondary / Accent
  static const Color secondary = Color(0xFFD06978); // Cinnamon Satin
  static const Color secondaryDark = Color(0xFFA85161); // Darker Cinnamon Satin

  // Neutral
  static const Color background = Color(0xFF0B0C10); // Smoky Black
  static const Color surface = Color(0xFF1A1B23);
  static const Color textPrimary = Color(0xFFFFFFFF); // White for dark background
  static const Color textSecondary = Color(0xFF9C9C9C); // Spanish Gray
  static const Color textTertiary = Color(0xFF4E5C75); // Black Coral
  static const Color border = Color(0xFF2A2D38); // Dark border

  // Status
  static const Color success = Color(0xFF6FBAFC); // Very Light Azure
  static const Color warning = Color(0xFFD06978); // Cinnamon Satin
  static const Color error = Color(0xFFD06978); // Cinnamon Satin
  static const Color info = Color(0xFF305BF3); // Ultramarine Blue
  
  // Inactive
  static const Color inactive = Color(0xFF4E5C75); // Black Coral

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
