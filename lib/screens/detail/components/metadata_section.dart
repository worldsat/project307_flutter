import 'package:flutter/material.dart';
import '../../../models/models.dart';
import '../../../theme/app_colors.dart';

class ProductMetadataSection extends StatelessWidget {
  final ProductDetail detail;

  const ProductMetadataSection({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Brand & SKU
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Brand: ${detail.brand}",
                style: const TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 11,
                ),
              ),
              Text(
                "SKU: ${detail.sku}",
                style: const TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          // Title
          Text(
            detail.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
              fontSize: 20,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),

          // Subtitle
          Text(
            detail.subtitle,
            style: const TextStyle(
              color: AppColors.onSurfaceVariant,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),

          // Rating & Social Proof
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.secondaryFixed,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: AppColors.secondary,
                      size: 13,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      "${detail.rating}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSecondaryFixed,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "(from ${detail.reviewCount} reviews)",
                style: const TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                "•",
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                "${detail.satisfactionPercent}% satisfaction",
                style: const TextStyle(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
