import 'package:flutter/material.dart';
import '../../../models/models.dart';
import '../../../theme/app_colors.dart';

class TrustBadgesStrip extends StatelessWidget {
  final List<TrustBadge> badges;

  const TrustBadgesStrip({super.key, required this.badges});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int index = 0; index < badges.length; index++) ...[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(badges[index].icon, size: 16, color: badges[index].tint),
                const SizedBox(width: 4),
                Text(
                  badges[index].label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            if (index < badges.length - 1)
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: AppColors.outlineVariant,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ],
      ),
    );
  }
}
