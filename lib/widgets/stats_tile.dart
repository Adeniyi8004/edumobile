import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/dimens.dart';

class StatsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value; // e.g. "3/5" or "8/16"

  const StatsTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final parts = value.split('/');
    final mainValue = parts[0];
    final totalValue = parts.length > 1 ? parts[1] : '';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimens.borderRadius),
      ),
      padding: const EdgeInsets.all(Dimens.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Dimens.padding),
          Icon(icon, size: 28, color: AppColors.textOnLight),
          const SizedBox(height: Dimens.padding),
          RichText(
            text: TextSpan(
              text: mainValue,
              style: TextStyle(
                fontSize: Dimens.heading2,
                fontWeight: FontWeight.w700,
                height: 1.0,
                color: AppColors.textOnLight,
              ),
              children: [
                if (totalValue.isNotEmpty)
                  TextSpan(
                    text: '/$totalValue' '$label',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: Dimens.heading3,
                      fontWeight: FontWeight.w500,
                      height: 1.0,
                      color: AppColors.textOnLight,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: Dimens.padding),
        ],
      ),
    );
  }
}
