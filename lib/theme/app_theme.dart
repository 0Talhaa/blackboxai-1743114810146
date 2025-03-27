import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../constants/dimens.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.background,
        surface: AppColors.surface,
        error: AppColors.error,
      ),
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.displayLarge,
        displayMedium: AppTextStyles.displayMedium,
        headlineLarge: AppTextStyles.headlineLarge,
        headlineMedium: AppTextStyles.headlineMedium,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        labelLarge: AppTextStyles.labelLarge,
        labelSmall: AppTextStyles.labelSmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(AppDimens.buttonHeight),
          textStyle: AppTextStyles.button,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
          ),
        ),
      ),
      cardTheme: CardTheme(
        elevation: AppDimens.elevationSmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
        ),
        margin: const EdgeInsets.all(AppDimens.marginSmall),
      ),
      appBarTheme: const AppBarTheme(
        elevation: AppDimens.elevationMedium,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headlineLarge,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: AppDimens.elevationMedium,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: AppTextStyles.labelSmall.copyWith(
          color: AppColors.primary,
        ),
        unselectedLabelStyle: AppTextStyles.labelSmall,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        error: AppColors.error,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        displayMedium: AppTextStyles.displayMedium.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineLarge: AppTextStyles.headlineLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineMedium: AppTextStyles.headlineMedium.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyLarge: AppTextStyles.bodyLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyMedium: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelLarge: AppTextStyles.labelLarge.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        labelSmall: AppTextStyles.labelSmall.copyWith(
          color: AppColors.darkTextSecondary,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: AppDimens.elevationMedium,
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: AppColors.primaryLight,
        unselectedItemColor: AppColors.darkTextSecondary,
      ),
    );
  }

  static InputDecorationTheme get inputDecorationTheme {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingMedium,
        vertical: AppDimens.paddingSmall,
      ),
    );
  }
}