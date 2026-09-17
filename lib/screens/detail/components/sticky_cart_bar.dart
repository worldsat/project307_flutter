import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class StickyAddToCartBar extends StatelessWidget {
  final double originalPrice;
  final double currentPrice;
  final int discountPercent;
  final bool isAddedToCart;
  final VoidCallback onAddToCartClick;

  const StickyAddToCartBar({
    super.key,
    required this.originalPrice,
    required this.currentPrice,
    required this.discountPercent,
    required this.isAddedToCart,
    required this.onAddToCartClick,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = isAddedToCart ? AppColors.secondary : AppColors.primary;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceBright,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Left Pricing Cluster
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "\$${originalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: AppColors.onSurfaceVariant,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "$discountPercent% OFF",
                        style: const TextStyle(
                          color: AppColors.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  "\$${currentPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.onSurface,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),

            // Primary Add To Cart Button
            Expanded(
              child: InkWell(
                onTap: onAddToCartClick,
                borderRadius: BorderRadius.circular(16),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: 48,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag,
                        color: AppColors.onPrimary,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isAddedToCart ? "Added to Cart ✓" : "Add to Cart",
                        style: const TextStyle(
                          color: AppColors.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
