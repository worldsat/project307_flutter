import 'package:flutter/material.dart';
import '../../../models/models.dart';
import '../../../theme/app_colors.dart';

class ColorVariantPicker extends StatelessWidget {
  final List<ColorVariant> colors;
  final int selectedIndex;
  final ValueChanged<int> onSelectColor;

  const ColorVariantPicker({
    super.key,
    required this.colors,
    required this.selectedIndex,
    required this.onSelectColor,
  });

  @override
  Widget build(BuildContext context) {
    if (colors.isEmpty) return const SizedBox.shrink();
    final selectedColorName = colors[selectedIndex.clamp(0, colors.length - 1)].name;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Selected Color:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                    fontSize: 14,
                  ),
                ),
                Text(
                  selectedColorName,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(colors.length, (index) {
                final variant = colors[index];
                final isSelected = index == selectedIndex;

                return GestureDetector(
                  onTap: () => onSelectColor(index),
                  child: AnimatedScale(
                    scale: isSelected ? 1.10 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      margin: const EdgeInsets.only(right: 14),
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        color: variant.color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: isSelected ? 2 : 1,
                          color: isSelected ? AppColors.primary : AppColors.outlineVariant,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: isSelected
                          ? Icon(
                              Icons.check_rounded,
                              size: 20,
                              color: variant.color == const Color(0xFFCBD5E1)
                                  ? Colors.black
                                  : Colors.white,
                            )
                          : null,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
