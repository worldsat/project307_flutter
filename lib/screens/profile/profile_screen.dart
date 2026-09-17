import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../state/app_state.dart';
import '../../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final user = MockData.sampleUserProfile;
    final orderStatus = MockData.sampleOrderStatus;
    final activeDelivery = MockData.sampleActiveDelivery;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          color: AppColors.surface,
          child: SafeArea(
            bottom: false,
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Brand Monogram + Title
                  Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer.withValues(alpha: 0.50),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.local_mall_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),

                  // Notification & Small Avatar
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => appState.showToast("No new notifications"),
                        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          color: AppColors.onSurfaceVariant,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.outlineVariant, width: 1),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/user_avatar.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            // 1. Profile Header Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceBright,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    // Ambient soft glowing spot (top right)
                    Positioned(
                      top: -20,
                      right: -20,
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer.withValues(alpha: 0.35),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    // Ambient soft glowing spot (bottom left)
                    Positioned(
                      bottom: -20,
                      left: -20,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryContainer.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          // Large Avatar with Verified Check Badge (64dp)
                          Stack(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/user_avatar.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (user.isVerified)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      color: AppColors.secondaryContainer,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.verified_rounded,
                                      color: Colors.white,
                                      size: 13,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(width: 14),

                          // Info Column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                // Member Tier Pill
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
                                        color: AppColors.onSecondaryFixed,
                                        size: 12,
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        user.memberTier,
                                        style: const TextStyle(
                                          color: AppColors.onSecondaryFixed,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${user.phone} / ${user.email}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColors.outline,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Edit Profile Button
                          InkWell(
                            onTap: () => appState.showToast("Edit profile opened"),
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: AppColors.surfaceContainerLow,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.edit_outlined,
                                color: AppColors.onSurfaceVariant,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 2. Wallet & Reward Club Trio Widget
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.surfaceBright,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Card 1: Wallet
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.account_balance_wallet_outlined,
                              color: AppColors.primary,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Wallet",
                            style: TextStyle(
                              color: AppColors.outline,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "\$${user.walletBalance.toStringAsFixed(2)}",
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: AppColors.onSurface,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 6),
                          InkWell(
                            onTap: () => appState.showToast("Top up wallet opened"),
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.primaryContainer,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, color: Colors.white, size: 12),
                                  SizedBox(width: 2),
                                  Text(
                                    "Top Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Card 2: Reward Club
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.secondary.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.stars_outlined,
                              color: AppColors.secondary,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Reward Club",
                            style: TextStyle(
                              color: AppColors.outline,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${user.rewardPoints}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.onSurface,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                "Pts",
                                style: TextStyle(
                                  color: AppColors.outline,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          InkWell(
                            onTap: () => appState.showToast("Redeem rewards opened"),
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceBright,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Redeem Rewards",
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Card 3: Active Coupons
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.tertiary.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.local_activity_outlined,
                              color: AppColors.tertiary,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Active Coupons",
                            style: TextStyle(
                              color: AppColors.outline,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${user.activeCouponsCount}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.primary,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 2),
                              const Text(
                                "Coupons",
                                style: TextStyle(
                                  color: AppColors.outline,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          InkWell(
                            onTap: () => appState.showToast("Coupons view opened"),
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceBright,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "View All",
                                maxLines: 1,
                                style: TextStyle(
                                  color: AppColors.onSurfaceVariant,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // 3. My Orders Overview & Tracker
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceBright,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Section Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 4,
                            height: 16,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            "My Orders",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.onSurface,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () => appState.showToast("All orders opened"),
                        child: const Row(
                          children: [
                            Text(
                              "View All",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColors.primary,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // 4 Status Items Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Processing
                      InkWell(
                        onTap: () => appState.showToast("Processing orders"),
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryContainer.withValues(alpha: 0.40),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Icon(
                                    Icons.local_shipping_outlined,
                                    color: AppColors.primary,
                                    size: 24,
                                  ),
                                ),
                                if (orderStatus.processingCount > 0)
                                  Positioned(
                                    top: -4,
                                    right: -4,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryContainer,
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: Text(
                                        "${orderStatus.processingCount}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Processing",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "${orderStatus.processingCount} active",
                              style: const TextStyle(
                                color: AppColors.outline,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Delivered
                      InkWell(
                        onTap: () => appState.showToast("Delivered orders"),
                        child: Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.task_alt_rounded,
                                color: AppColors.onSurfaceVariant,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Delivered",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "${orderStatus.deliveredCount} orders",
                              style: const TextStyle(
                                color: AppColors.outline,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Cancelled
                      InkWell(
                        onTap: () => appState.showToast("Cancelled orders"),
                        child: Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.cancel_outlined,
                                color: AppColors.onSurfaceVariant,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Cancelled",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "${orderStatus.cancelledCount} orders",
                              style: const TextStyle(
                                color: AppColors.outline,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Returned
                      InkWell(
                        onTap: () => appState.showToast("Returned orders"),
                        child: Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainerLow,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.replay_rounded,
                                color: AppColors.onSurfaceVariant,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Returned",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurface,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "${orderStatus.returnedCount} orders",
                              style: const TextStyle(
                                color: AppColors.outline,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Active Delivery Mini Banner
                  InkWell(
                    onTap: () => appState.showToast("Tracking order #${activeDelivery.orderId}"),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: const BoxDecoration(
                              color: AppColors.surfaceContainerLowest,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(
                              Icons.inventory_2_outlined,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Order #${activeDelivery.orderId}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.onSurface,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: const BoxDecoration(
                                        color: AppColors.secondaryContainer,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      activeDelivery.statusText,
                                      style: const TextStyle(
                                        color: AppColors.secondary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  activeDelivery.subtext,
                                  style: const TextStyle(
                                    color: AppColors.outline,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.outlineVariant,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // 4. Account Menu Card
            Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceBright,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  for (int i = 0; i < MockData.profileMenuItems.length; i++) ...[
                    InkWell(
                      onTap: () => appState.showToast("${MockData.profileMenuItems[i].title} opened"),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: AppColors.surfaceContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                MockData.profileMenuItems[i].icon,
                                color: AppColors.onSurfaceVariant,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        MockData.profileMenuItems[i].title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.onSurface,
                                          fontSize: 15,
                                        ),
                                      ),
                                      if (MockData.profileMenuItems[i].badgeText != null) ...[
                                        const SizedBox(width: 6),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: MockData.profileMenuItems[i].isHighlightedBadge
                                                ? AppColors.primaryFixed
                                                : AppColors.surfaceContainerHighest,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            MockData.profileMenuItems[i].badgeText!,
                                            style: TextStyle(
                                              color: MockData.profileMenuItems[i].isHighlightedBadge
                                                  ? AppColors.onPrimaryFixed
                                                  : AppColors.onSurfaceVariant,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    MockData.profileMenuItems[i].subtitle,
                                    style: const TextStyle(
                                      color: AppColors.outline,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.chevron_right_rounded,
                              color: AppColors.outline,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (i < MockData.profileMenuItems.length - 1)
                      const Padding(
                        padding: EdgeInsets.only(left: 70),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.surfaceContainerLow,
                        ),
                      ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 12),

            // 5. Logout Button
            InkWell(
              onTap: () => appState.showToast("Logged out of account"),
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.errorContainer.withValues(alpha: 0.60),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout_rounded,
                      color: AppColors.errorRed,
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Log Out of Account",
                      style: TextStyle(
                        color: AppColors.errorRed,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
