import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class ProductGallerySection extends StatelessWidget {
  final List<String> galleryImages;
  final int selectedIndex;
  final bool isFavorite;
  final ValueChanged<int> onSelectImage;
  final VoidCallback onShareClick;
  final VoidCallback onToggleFavorite;

  const ProductGallerySection({
    super.key,
    required this.galleryImages,
    required this.selectedIndex,
    required this.isFavorite,
    required this.onSelectImage,
    required this.onShareClick,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    if (galleryImages.isEmpty) return const SizedBox.shrink();
    final currentImage = galleryImages[selectedIndex.clamp(0, galleryImages.length - 1)];

    return Container(
      color: AppColors.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          // Top Badges & Actions Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Special Deal Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.local_fire_department_rounded,
                      color: AppColors.onPrimaryContainer,
                      size: 16,
                    ),
                    SizedBox(width: 6),
                    Text(
                      "Special Deal / Best Offer",
                      style: TextStyle(
                        color: AppColors.onPrimaryContainer,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // Circular Quick Action Buttons
              Row(
                children: [
                  InkWell(
                    onTap: onShareClick,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceBright,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.share_outlined,
                        color: AppColors.onSurface,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: onToggleFavorite,
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceBright,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                        color: AppColors.primary,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Main Visual Stage (1:1 Ratio)
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      currentImage,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Official Image Badge (Top Right)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh.withValues(alpha: 0.90),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Text(
                        "Official Image",
                        style: TextStyle(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),

                  // Slide Indicators (Bottom Center)
                  Positioned(
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.inverseSurface.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(galleryImages.length, (index) {
                          final isSelected = index == selectedIndex;
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.5),
                            width: isSelected ? 18 : 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.50),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Gallery Thumbnails Strip
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(galleryImages.length, (index) {
              final isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () => onSelectImage(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 54,
                  height: 54,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.surfaceBright : AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      width: isSelected ? 2 : 1,
                      color: isSelected ? AppColors.primary : AppColors.outlineVariant,
                    ),
                  ),
                  child: Opacity(
                    opacity: isSelected ? 1.0 : 0.65,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        galleryImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
