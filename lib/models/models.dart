import 'package:flutter/material.dart';

enum BadgeIconType {
  shipping,
  warranty,
  verified,
}

enum BottomNavTab {
  home("Home"),
  categories("Categories"),
  cart("Cart", badgeCount: 2),
  profile("Profile");

  final String title;
  final int badgeCount;
  const BottomNavTab(this.title, {this.badgeCount = 0});
}

class Category {
  final String id;
  final String name;
  final IconData icon;
  final Color iconColor;
  final Color containerColor;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.containerColor,
  });
}

class SubCategory {
  final String id;
  final String name;
  final int itemCount;
  final IconData icon;

  const SubCategory({
    required this.id,
    required this.name,
    required this.itemCount,
    required this.icon,
  });
}

class CategoryCollection {
  final String id;
  final String name;
  final IconData icon;
  final String bannerTag;
  final String bannerTitle;
  final String bannerSubtitle;
  final String discountText;
  final List<SubCategory> subcategories;
  final List<Product> products;

  const CategoryCollection({
    required this.id,
    required this.name,
    required this.icon,
    required this.bannerTag,
    required this.bannerTitle,
    required this.bannerSubtitle,
    required this.discountText,
    required this.subcategories,
    required this.products,
  });
}

class Product {
  final String id;
  final String title;
  final double originalPrice;
  final double currentPrice;
  final String currency;
  final int discountPercent;
  final double rating;
  final int reviewCount;
  final String imagePath;
  final String? badgeText;
  final double stockProgress;
  final String? stockRemainingText;
  final String? stockClaimedText;
  final bool isFavorite;
  final String? deliveryBadge;
  final BadgeIconType deliveryBadgeIconType;

  const Product({
    required this.id,
    required this.title,
    required this.originalPrice,
    required this.currentPrice,
    this.currency = "USD",
    this.discountPercent = 0,
    this.rating = 0.0,
    this.reviewCount = 0,
    required this.imagePath,
    this.badgeText,
    this.stockProgress = 0.0,
    this.stockRemainingText,
    this.stockClaimedText,
    this.isFavorite = false,
    this.deliveryBadge,
    this.deliveryBadgeIconType = BadgeIconType.shipping,
  });

  Product copyWith({
    String? id,
    String? title,
    double? originalPrice,
    double? currentPrice,
    String? currency,
    int? discountPercent,
    double? rating,
    int? reviewCount,
    String? imagePath,
    String? badgeText,
    double? stockProgress,
    String? stockRemainingText,
    String? stockClaimedText,
    bool? isFavorite,
    String? deliveryBadge,
    BadgeIconType? deliveryBadgeIconType,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      originalPrice: originalPrice ?? this.originalPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      currency: currency ?? this.currency,
      discountPercent: discountPercent ?? this.discountPercent,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      imagePath: imagePath ?? this.imagePath,
      badgeText: badgeText ?? this.badgeText,
      stockProgress: stockProgress ?? this.stockProgress,
      stockRemainingText: stockRemainingText ?? this.stockRemainingText,
      stockClaimedText: stockClaimedText ?? this.stockClaimedText,
      isFavorite: isFavorite ?? this.isFavorite,
      deliveryBadge: deliveryBadge ?? this.deliveryBadge,
      deliveryBadgeIconType: deliveryBadgeIconType ?? this.deliveryBadgeIconType,
    );
  }
}

class PromoBanner {
  final String id;
  final String tag;
  final String title;
  final String promoCode;
  final int remainingSeconds;

  const PromoBanner({
    required this.id,
    required this.tag,
    required this.title,
    required this.promoCode,
    required this.remainingSeconds,
  });
}

class TrustBadge {
  final String id;
  final String label;
  final IconData icon;
  final Color tint;

  const TrustBadge({
    required this.id,
    required this.label,
    required this.icon,
    required this.tint,
  });
}

class EditorialBanner {
  final String id;
  final String tag;
  final String title;
  final String subtitle;
  final String imagePath;

  const EditorialBanner({
    required this.id,
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

class ColorVariant {
  final String id;
  final String name;
  final Color color;

  const ColorVariant({
    required this.id,
    required this.name,
    required this.color,
  });
}

class ProductHighlight {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProductHighlight({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class ReviewSummary {
  final double averageRating;
  final int totalReviews;
  final int satisfactionPercent;
  final int star5Percent;
  final int star4Percent;
  final int star3Percent;

  const ReviewSummary({
    required this.averageRating,
    required this.totalReviews,
    required this.satisfactionPercent,
    required this.star5Percent,
    required this.star4Percent,
    required this.star3Percent,
  });
}

class UserReview {
  final String id;
  final String reviewerName;
  final String initials;
  final bool isVerified;
  final String dateText;
  final String comment;
  final String purchasedVariant;
  final int upvotes;
  final int downvotes;

  const UserReview({
    required this.id,
    required this.reviewerName,
    required this.initials,
    required this.isVerified,
    required this.dateText,
    required this.comment,
    required this.purchasedVariant,
    required this.upvotes,
    required this.downvotes,
  });

  UserReview copyWith({
    String? id,
    String? reviewerName,
    String? initials,
    bool? isVerified,
    String? dateText,
    String? comment,
    String? purchasedVariant,
    int? upvotes,
    int? downvotes,
  }) {
    return UserReview(
      id: id ?? this.id,
      reviewerName: reviewerName ?? this.reviewerName,
      initials: initials ?? this.initials,
      isVerified: isVerified ?? this.isVerified,
      dateText: dateText ?? this.dateText,
      comment: comment ?? this.comment,
      purchasedVariant: purchasedVariant ?? this.purchasedVariant,
      upvotes: upvotes ?? this.upvotes,
      downvotes: downvotes ?? this.downvotes,
    );
  }
}

class ProductDetail {
  final String id;
  final String brand;
  final String sku;
  final String title;
  final String subtitle;
  final double originalPrice;
  final double currentPrice;
  final int discountPercent;
  final double rating;
  final int reviewCount;
  final int satisfactionPercent;
  final List<String> galleryImages;
  final List<ColorVariant> colors;
  final List<ProductHighlight> highlights;
  final ReviewSummary reviewsSummary;
  final UserReview featuredReview;

  const ProductDetail({
    required this.id,
    required this.brand,
    required this.sku,
    required this.title,
    required this.subtitle,
    required this.originalPrice,
    required this.currentPrice,
    required this.discountPercent,
    required this.rating,
    required this.reviewCount,
    required this.satisfactionPercent,
    required this.galleryImages,
    required this.colors,
    required this.highlights,
    required this.reviewsSummary,
    required this.featuredReview,
  });
}

class CartItem {
  final String id;
  final String productId;
  final String title;
  final String imagePath;
  final String colorName;
  final Color colorHex;
  final String tagText;
  final bool isTagPrimary;
  final double originalPrice;
  final double currentPrice;
  final int quantity;

  const CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.imagePath,
    required this.colorName,
    required this.colorHex,
    required this.tagText,
    this.isTagPrimary = false,
    required this.originalPrice,
    required this.currentPrice,
    this.quantity = 1,
  });

  CartItem copyWith({
    String? id,
    String? productId,
    String? title,
    String? imagePath,
    String? colorName,
    Color? colorHex,
    String? tagText,
    bool? isTagPrimary,
    double? originalPrice,
    double? currentPrice,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      imagePath: imagePath ?? this.imagePath,
      colorName: colorName ?? this.colorName,
      colorHex: colorHex ?? this.colorHex,
      tagText: tagText ?? this.tagText,
      isTagPrimary: isTagPrimary ?? this.isTagPrimary,
      originalPrice: originalPrice ?? this.originalPrice,
      currentPrice: currentPrice ?? this.currentPrice,
      quantity: quantity ?? this.quantity,
    );
  }
}

class UserProfile {
  final String name;
  final String email;
  final String phone;
  final String avatarPath;
  final bool isVerified;
  final String memberTier;
  final double walletBalance;
  final int rewardPoints;
  final int activeCouponsCount;
  int get couponsCount => activeCouponsCount;

  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarPath,
    required this.isVerified,
    required this.memberTier,
    required this.walletBalance,
    required this.rewardPoints,
    required this.activeCouponsCount,
  });
}

class OrderStatusCount {
  final int processingCount;
  final int deliveredCount;
  final int cancelledCount;
  final int returnedCount;

  const OrderStatusCount({
    required this.processingCount,
    required this.deliveredCount,
    required this.cancelledCount,
    required this.returnedCount,
  });
}

class ActiveDelivery {
  final String orderId;
  final String statusText;
  final String subtext;

  const ActiveDelivery({
    required this.orderId,
    required this.statusText,
    required this.subtext,
  });
}

class ProfileMenuItem {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final String? badgeText;
  final bool isHighlightedBadge;

  const ProfileMenuItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.badgeText,
    this.isHighlightedBadge = false,
  });
}
