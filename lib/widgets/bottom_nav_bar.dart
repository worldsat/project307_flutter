import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_colors.dart';

class StoreBottomNavBar extends StatelessWidget {
  final BottomNavTab selectedTab;
  final int cartItemCount;
  final ValueChanged<BottomNavTab> onTabSelected;

  const StoreBottomNavBar({
    super.key,
    required this.selectedTab,
    required this.cartItemCount,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                tab: BottomNavTab.home,
                icon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: "Home",
              ),
              _buildNavItem(
                tab: BottomNavTab.categories,
                icon: Icons.grid_view_outlined,
                activeIcon: Icons.grid_view_rounded,
                label: "Categories",
              ),
              _buildNavItem(
                tab: BottomNavTab.cart,
                icon: Icons.shopping_bag_outlined,
                activeIcon: Icons.shopping_bag_rounded,
                label: "Cart",
                badgeCount: cartItemCount,
              ),
              _buildNavItem(
                tab: BottomNavTab.profile,
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BottomNavTab tab,
    required IconData icon,
    required IconData activeIcon,
    required String label,
    int? badgeCount,
  }) {
    final isSelected = selectedTab == tab;
    final color = isSelected ? AppColors.primaryContainer : AppColors.onSurfaceVariant;

    return InkWell(
      onTap: () => onTabSelected(tab),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  isSelected ? activeIcon : icon,
                  color: color,
                  size: 24,
                ),
                if (badgeCount != null && badgeCount > 0)
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                      decoration: BoxDecoration(
                        color: AppColors.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                      child: Text(
                        badgeCount > 99 ? "99+" : "$badgeCount",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
