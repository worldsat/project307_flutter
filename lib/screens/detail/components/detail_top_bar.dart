import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class ProductDetailTopBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFavorite;
  final VoidCallback onBackClick;
  final VoidCallback onShareClick;
  final VoidCallback onToggleFavorite;
  final VoidCallback onBagClick;

  const ProductDetailTopBar({
    super.key,
    required this.isFavorite,
    required this.onBackClick,
    required this.onShareClick,
    required this.onToggleFavorite,
    required this.onBagClick,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back Button + Title
              Row(
                children: [
                  IconButton(
                    onPressed: onBackClick,
                    constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.onSurface,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Product Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),

              // Action Icons
              Row(
                children: [
                  IconButton(
                    onPressed: onShareClick,
                    constraints: const BoxConstraints(minWidth: 38, minHeight: 38),
                    icon: const Icon(
                      Icons.share_outlined,
                      color: AppColors.onSurface,
                      size: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: onToggleFavorite,
                    constraints: const BoxConstraints(minWidth: 38, minHeight: 38),
                    icon: Icon(
                      isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                  IconButton(
                    onPressed: onBagClick,
                    constraints: const BoxConstraints(minWidth: 38, minHeight: 38),
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
