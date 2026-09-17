import 'package:flutter/material.dart';
import '../../../models/models.dart';
import '../../../theme/app_colors.dart';

class BestSellersSection extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<String> onToggleFavorite;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<String> onProductClick;
  final VoidCallback onFilterSortClick;
  final bool Function(String) isFavorite;

  const BestSellersSection({
    super.key,
    required this.products,
    required this.onToggleFavorite,
    required this.onAddToCart,
    required this.onProductClick,
    required this.onFilterSortClick,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // Section Header
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Best Sellers",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                      ),
                    ),
                    Text(
                      "Most popular choices this week",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.outline,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: onFilterSortClick,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "Filter / Sort",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.swap_vert_rounded,
                          color: AppColors.primary,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2-Column Pairs
          for (int i = 0; i < products.length; i += 2) ...[
            Row(
              children: [
                Expanded(
                  child: GridProductCard(
                    product: products[i],
                    isFavorite: isFavorite(products[i].id),
                    onToggleFavorite: () => onToggleFavorite(products[i].id),
                    onAddToCart: () => onAddToCart(products[i]),
                    onClick: () => onProductClick(products[i].id),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: i + 1 < products.length
                      ? GridProductCard(
                          product: products[i + 1],
                          isFavorite: isFavorite(products[i + 1].id),
                          onToggleFavorite: () => onToggleFavorite(products[i + 1].id),
                          onAddToCart: () => onAddToCart(products[i + 1]),
                          onClick: () => onProductClick(products[i + 1].id),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

class GridProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onAddToCart;
  final VoidCallback onClick;

  const GridProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onAddToCart,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceBright,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Wishlist Button (1:1 Ratio)
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        product.imagePath,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: InkWell(
                        onTap: onToggleFavorite,
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.85),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                            color: isFavorite ? AppColors.primary : AppColors.outline,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Star Rating & Review Count
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: AppColors.warningAmber,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  "${product.rating}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  "(${product.reviewCount})",
                  style: const TextStyle(
                    color: AppColors.outline,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Title (2 lines max, height 36)
            SizedBox(
              height: 36,
              child: Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurface,
                  fontSize: 13,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 4),

            // Delivery or Guarantee Tag
            if (product.deliveryBadge != null)
              Row(
                children: [
                  const Icon(
                    Icons.local_shipping_outlined,
                    color: AppColors.primary,
                    size: 13,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    product.deliveryBadge!,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                    ),
                  ),
                ],
              )
            else
              const SizedBox(height: 17),
            const SizedBox(height: 8),

            // Price and Add Button Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${product.originalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.outline,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      "\$${product.currentPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                    ),
                  ],
                ),

                // Add to Cart Button (38dp rounded square)
                InkWell(
                  onTap: onAddToCart,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
