import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class HomeTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onNotificationsClick;
  final VoidCallback onBrandBagClick;

  const HomeTopBar({
    super.key,
    required this.onNotificationsClick,
    required this.onBrandBagClick,
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
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left: Avatar thumbnail + Brand/Home Title
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.outlineVariant, width: 1),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/user_avatar.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              // Right: Notification Bell & Brand Shopping Bag
              Row(
                children: [
                  IconButton(
                    onPressed: onNotificationsClick,
                    constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: AppColors.onSurfaceVariant,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: onBrandBagClick,
                    constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.primary,
                      size: 24,
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
