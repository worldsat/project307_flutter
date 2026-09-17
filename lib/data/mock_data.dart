import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme/app_colors.dart';

class MockData {
  // 1. Trust Badges
  static const List<TrustBadge> trustBadges = [
    TrustBadge(
      id: "tb_shipping",
      label: "Free Express Shipping",
      icon: Icons.local_shipping_outlined,
      tint: AppColors.secondaryContainer,
    ),
    TrustBadge(
      id: "tb_guarantee",
      label: "100% Original Guarantee",
      icon: Icons.verified_outlined,
      tint: AppColors.primary,
    ),
    TrustBadge(
      id: "tb_return",
      label: "7-Day Return",
      icon: Icons.autorenew_outlined,
      tint: AppColors.tertiaryContainer,
    ),
  ];

  // 2. Hero Promo Banner
  static const PromoBanner heroPromoBanner = PromoBanner(
    id: "banner_autumn_festival",
    tag: "Autumn Festival",
    title: "30% Mega Sale",
    promoCode: "FALL1403",
    remainingSeconds: 12 * 3600 + 44 * 60 + 18,
  );

  // 3. Featured Categories
  static const List<Category> categories = [
    Category(
      id: "cat_digital",
      name: "Digital",
      icon: Icons.devices_outlined,
      iconColor: AppColors.primary,
      containerColor: AppColors.surfaceContainerLow,
    ),
    Category(
      id: "cat_fashion",
      name: "Fashion",
      icon: Icons.checkroom_outlined,
      iconColor: AppColors.secondary,
      containerColor: AppColors.surfaceContainerLow,
    ),
    Category(
      id: "cat_beauty",
      name: "Beauty",
      icon: Icons.spa_outlined,
      iconColor: AppColors.primary,
      containerColor: AppColors.surfaceContainerLow,
    ),
    Category(
      id: "cat_home",
      name: "Home",
      icon: Icons.kitchen_outlined,
      iconColor: AppColors.secondaryContainer,
      containerColor: AppColors.surfaceContainerLow,
    ),
    Category(
      id: "cat_grocery",
      name: "Grocery",
      icon: Icons.shopping_cart_outlined,
      iconColor: AppColors.tertiary,
      containerColor: AppColors.surfaceContainerLow,
    ),
    Category(
      id: "cat_sports",
      name: "Sports",
      icon: Icons.fitness_center_outlined,
      iconColor: Color(0xFF64748B),
      containerColor: AppColors.surfaceContainerLow,
    ),
  ];

  // 4. Flash Deals
  static const List<Product> flashDeals = [
    Product(
      id: "deal_1",
      title: "Pro Sound Wireless Headphones 2024",
      originalPrice: 109.99,
      currentPrice: 59.99,
      discountPercent: 45,
      imagePath: "assets/images/product_earbuds.jpg",
      badgeText: "45% OFF",
      stockProgress: 0.80,
      stockRemainingText: "Only 4 left",
      stockClaimedText: "80% claimed",
    ),
    Product(
      id: "deal_2",
      title: "Ultra Leather Smartwatch Pro",
      originalPrice: 165.00,
      currentPrice: 118.80,
      discountPercent: 28,
      imagePath: "assets/images/product_smartwatch.jpg",
      badgeText: "28% OFF",
      stockProgress: 0.60,
      stockRemainingText: "7 remaining",
      stockClaimedText: "60% claimed",
    ),
    Product(
      id: "deal_3",
      title: "Pro Sound Max ANC Headphones",
      originalPrice: 249.99,
      currentPrice: 149.99,
      discountPercent: 40,
      imagePath: "assets/images/product_headphones_main.jpg",
      badgeText: "40% OFF",
      stockProgress: 0.75,
      stockRemainingText: "Only 3 left",
      stockClaimedText: "75% claimed",
    ),
  ];

  // 5. Editorial Banners
  static const List<EditorialBanner> editorialBanners = [
    EditorialBanner(
      id: "ed_fashion",
      tag: "Autumn Style",
      title: "Daily Fashion",
      subtitle: "Up to 40% Off",
      imagePath: "assets/images/headphones_lifestyle.jpg",
    ),
    EditorialBanner(
      id: "ed_shoes",
      tag: "Comfort Shoes",
      title: "Comfort Sneakers",
      subtitle: "Global Brands",
      imagePath: "assets/images/banner_sneakers.jpg",
    ),
  ];

  // 6. Best Sellers Grid
  static const List<Product> bestSellers = [
    Product(
      id: "prod_mug",
      title: "Stainless Steel Travel Mug Alpha",
      originalPrice: 24.00,
      currentPrice: 18.50,
      rating: 4.8,
      reviewCount: 124,
      imagePath: "assets/images/product_tumbler.jpg",
      deliveryBadge: "Free Shipping",
      deliveryBadgeIconType: BadgeIconType.shipping,
    ),
    Product(
      id: "prod_keyboard",
      title: "Retro Mechanical Wireless Keyboard",
      originalPrice: 89.00,
      currentPrice: 74.99,
      rating: 4.9,
      reviewCount: 340,
      imagePath: "assets/images/product_keyboard.jpg",
      deliveryBadge: "18-Month Warranty",
      deliveryBadgeIconType: BadgeIconType.warranty,
    ),
    Product(
      id: "prod_serum",
      title: "Deep Hydrating Hyaluronic Serum",
      originalPrice: 19.99,
      currentPrice: 15.20,
      rating: 4.7,
      reviewCount: 88,
      imagePath: "assets/images/product_serum.jpg",
      deliveryBadge: "Free Shipping",
      deliveryBadgeIconType: BadgeIconType.shipping,
    ),
    Product(
      id: "prod_lamp",
      title: "Modern Touch Rechargeable Bedside Lamp",
      originalPrice: 36.00,
      currentPrice: 27.99,
      rating: 4.9,
      reviewCount: 210,
      imagePath: "assets/images/product_lamp.jpg",
      deliveryBadge: "Original Guarantee",
      deliveryBadgeIconType: BadgeIconType.verified,
    ),
  ];

  // 7. Product Details Mock Data
  static const ProductDetail sampleHeadphoneDetail = ProductDetail(
    id: "deal_3",
    brand: "Sony (Sony Sound Series)",
    sku: "DK-99402",
    title: "Pro Sound Max Wireless Over-Ear ANC Headphones",
    subtitle: "Sony Pro Sound Max Flagship Wireless Audio",
    originalPrice: 295.00,
    currentPrice: 249.99,
    discountPercent: 15,
    rating: 4.8,
    reviewCount: 124,
    satisfactionPercent: 89,
    galleryImages: [
      "assets/images/product_headphones_main.jpg",
      "assets/images/headphones_detail.jpg",
      "assets/images/headphones_case.jpg",
      "assets/images/headphones_lifestyle.jpg",
    ],
    colors: [
      ColorVariant(id: "color_black", name: "Matte Carbon Black", color: Color(0xFF171717)),
      ColorVariant(id: "color_silver", name: "Titanium Silver", color: Color(0xFFCBD5E1)),
      ColorVariant(id: "color_navy", name: "Midnight Navy", color: Color(0xFF1E1B4B)),
    ],
    highlights: [
      ProductHighlight(
        icon: Icons.battery_charging_full_outlined,
        title: "40hr Battery",
        subtitle: "Fast Charging",
      ),
      ProductHighlight(
        icon: Icons.noise_aware_outlined,
        title: "Active Noise Cancelling",
        subtitle: "Smart ANC",
      ),
      ProductHighlight(
        icon: Icons.water_drop_outlined,
        title: "Water Resistant",
        subtitle: "IPX5 Standard",
      ),
    ],
    reviewsSummary: ReviewSummary(
      averageRating: 4.8,
      totalReviews: 124,
      satisfactionPercent: 89,
      star5Percent: 85,
      star4Percent: 10,
      star3Percent: 5,
    ),
    featuredReview: UserReview(
      id: "rev_1",
      reviewerName: "Saman M.",
      initials: "SM",
      isVerified: true,
      dateText: "3 days ago",
      comment: "The sound separation and clarity on these headphones are phenomenal. The active noise cancellation completely cuts out subway noise and open-office chatter.",
      purchasedVariant: "Matte Carbon Black",
      upvotes: 22,
      downvotes: 1,
    ),
  );

  static const ProductDetail sampleSmartwatchDetail = ProductDetail(
    id: "deal_2",
    brand: "FitPro Smart Tech",
    sku: "SW-8820",
    title: "Ultra Leather Smartwatch Pro",
    subtitle: "Precision AMOLED Health Tracker & Real-time GPS",
    originalPrice: 165.00,
    currentPrice: 118.80,
    discountPercent: 28,
    rating: 4.7,
    reviewCount: 89,
    satisfactionPercent: 92,
    galleryImages: [
      "assets/images/product_smartwatch.jpg",
    ],
    colors: [
      ColorVariant(id: "color_graphite", name: "Graphite Silver", color: Color(0xFFCBD5E1)),
      ColorVariant(id: "color_obsidian", name: "Obsidian Black", color: Color(0xFF1E293B)),
      ColorVariant(id: "color_rose", name: "Rose Gold", color: Color(0xFFFBCFE8)),
    ],
    highlights: [
      ProductHighlight(icon: Icons.battery_charging_full_outlined, title: "14-Day Battery", subtitle: "Ultra Low Power"),
      ProductHighlight(icon: Icons.monitor_heart_outlined, title: "Health Sensors", subtitle: "SpO2 & Heart Rate"),
      ProductHighlight(icon: Icons.water_drop_outlined, title: "5 ATM Waterproof", subtitle: "Swim-proof 50m"),
    ],
    reviewsSummary: ReviewSummary(
      averageRating: 4.7,
      totalReviews: 89,
      satisfactionPercent: 92,
      star5Percent: 82,
      star4Percent: 12,
      star3Percent: 6,
    ),
    featuredReview: UserReview(
      id: "rev_sw",
      reviewerName: "Amir Reza K.",
      initials: "AK",
      isVerified: true,
      dateText: "1 week ago",
      comment: "The display is vibrant and crystal clear under direct sunlight. Battery lasts well over 10 days on a single charge.",
      purchasedVariant: "Graphite Silver",
      upvotes: 18,
      downvotes: 0,
    ),
  );

  static const ProductDetail sampleEarbudsDetail = ProductDetail(
    id: "deal_1",
    brand: "Pro Sound Audio",
    sku: "EB-3021",
    title: "Pro Sound Wireless Headphones 2024",
    subtitle: "True Wireless Stereo Earbuds with Dynamic Bass Boost",
    originalPrice: 109.99,
    currentPrice: 59.99,
    discountPercent: 45,
    rating: 4.6,
    reviewCount: 92,
    satisfactionPercent: 88,
    galleryImages: ["assets/images/product_earbuds.jpg"],
    colors: [
      ColorVariant(id: "color_eb_black", name: "Matte Carbon Black", color: Color(0xFF1E293B)),
      ColorVariant(id: "color_eb_white", name: "Pearl White", color: Color(0xFFF1F5F9)),
    ],
    highlights: [
      ProductHighlight(icon: Icons.battery_charging_full_outlined, title: "32hr Battery", subtitle: "Fast USB-C Case"),
      ProductHighlight(icon: Icons.mic_none_outlined, title: "Dual-Mic ENC", subtitle: "Crystal Clear Calls"),
      ProductHighlight(icon: Icons.water_drop_outlined, title: "IPX5 Splashproof", subtitle: "Gym & Workout Safe"),
    ],
    reviewsSummary: ReviewSummary(
      averageRating: 4.6,
      totalReviews: 92,
      satisfactionPercent: 88,
      star5Percent: 78,
      star4Percent: 14,
      star3Percent: 8,
    ),
    featuredReview: UserReview(
      id: "rev_eb",
      reviewerName: "Nima T.",
      initials: "NT",
      isVerified: true,
      dateText: "5 days ago",
      comment: "Super lightweight and snug fit. The bass response is punchy without muddying the vocals.",
      purchasedVariant: "Matte Carbon Black",
      upvotes: 15,
      downvotes: 1,
    ),
  );

  static const ProductDetail sampleKeyboardDetail = ProductDetail(
    id: "prod_keyboard",
    brand: "RetroCraft Labs",
    sku: "KB-770",
    title: "Retro Mechanical Wireless Keyboard",
    subtitle: "Hot-Swappable Linear Gateron Switches & PBT Keycaps",
    originalPrice: 89.00,
    currentPrice: 74.99,
    discountPercent: 16,
    rating: 4.9,
    reviewCount: 340,
    satisfactionPercent: 96,
    galleryImages: ["assets/images/product_keyboard.jpg"],
    colors: [
      ColorVariant(id: "color_kb_mint", name: "Pastel Mint", color: Color(0xFFD1FAE5)),
      ColorVariant(id: "color_kb_beige", name: "Vintage Beige", color: Color(0xFFFEF3C7)),
      ColorVariant(id: "color_kb_slate", name: "Slate Charcoal", color: Color(0xFF475569)),
    ],
    highlights: [
      ProductHighlight(icon: Icons.devices_outlined, title: "Tri-Mode Wireless", subtitle: "BT 5.2 / 2.4G / USB-C"),
      ProductHighlight(icon: Icons.battery_charging_full_outlined, title: "4000mAh Battery", subtitle: "Up to 200 Hours"),
      ProductHighlight(icon: Icons.security_outlined, title: "Hot-Swappable", subtitle: "3-pin & 5-pin Compatible"),
    ],
    reviewsSummary: ReviewSummary(
      averageRating: 4.9,
      totalReviews: 340,
      satisfactionPercent: 96,
      star5Percent: 90,
      star4Percent: 7,
      star3Percent: 3,
    ),
    featuredReview: UserReview(
      id: "rev_kb",
      reviewerName: "Darya S.",
      initials: "DS",
      isVerified: true,
      dateText: "2 days ago",
      comment: "The typing acoustics are pure creamy thock right out of the box! Zero stabilizer rattle.",
      purchasedVariant: "Pastel Mint",
      upvotes: 34,
      downvotes: 0,
    ),
  );

  static const ProductDetail sampleMugDetail = ProductDetail(
    id: "prod_mug",
    brand: "HydroLife Co.",
    sku: "TM-450",
    title: "Stainless Steel Travel Mug Alpha",
    subtitle: "Double-Wall Vacuum Insulated Commuter Tumbler",
    originalPrice: 24.00,
    currentPrice: 18.50,
    discountPercent: 23,
    rating: 4.8,
    reviewCount: 124,
    satisfactionPercent: 94,
    galleryImages: ["assets/images/product_tumbler.jpg"],
    colors: [
      ColorVariant(id: "color_mug_rose", name: "Dusty Rose", color: Color(0xFFFDA4AF)),
      ColorVariant(id: "color_mug_cream", name: "Matte Sand", color: Color(0xFFF5F5F4)),
      ColorVariant(id: "color_mug_green", name: "Sage Green", color: Color(0xFF6EE7B7)),
    ],
    highlights: [
      ProductHighlight(icon: Icons.local_shipping_outlined, title: "Thermal Lock", subtitle: "12h Hot / 24h Cold"),
      ProductHighlight(icon: Icons.verified_outlined, title: "18/8 Pro Steel", subtitle: "BPA Free & Food Grade"),
      ProductHighlight(icon: Icons.water_drop_outlined, title: "100% Leakproof", subtitle: "Twist Lock Travel Cap"),
    ],
    reviewsSummary: ReviewSummary(
      averageRating: 4.8,
      totalReviews: 124,
      satisfactionPercent: 94,
      star5Percent: 86,
      star4Percent: 10,
      star3Percent: 4,
    ),
    featuredReview: UserReview(
      id: "rev_mug",
      reviewerName: "Maryam Z.",
      initials: "MZ",
      isVerified: true,
      dateText: "4 days ago",
      comment: "My coffee stays piping hot from 8 AM to late afternoon. The matte dusty rose finish doesn't scratch.",
      purchasedVariant: "Dusty Rose",
      upvotes: 19,
      downvotes: 0,
    ),
  );

  static const ProductDetail sampleSerumDetail = ProductDetail(
    id: "prod_serum",
    brand: "PureGlow Derma Labs",
    sku: "SR-901",
    title: "Deep Hydrating Hyaluronic Serum",
    subtitle: "Multi-Molecular Hyaluronic Acid Moisture Complex",
    originalPrice: 19.99,
    currentPrice: 15.20,
    discountPercent: 24,
    rating: 4.7,
    reviewCount: 88,
    satisfactionPercent: 91,
    galleryImages: ["assets/images/product_serum.jpg"],
    colors: [
      ColorVariant(id: "color_dew", name: "Pure Dew", color: Color(0xFFE0F2FE)),
      ColorVariant(id: "color_glow", name: "Rose Essence", color: Color(0xFFFFE4E6)),
    ],
    highlights: [
      ProductHighlight(icon: Icons.water_drop_outlined, title: "2% Multi-HA", subtitle: "Instant Plumping Effect"),
      ProductHighlight(icon: Icons.verified_outlined, title: "Derm Tested", subtitle: "Non-Comedogenic"),
      ProductHighlight(icon: Icons.spa_outlined, title: "Clean Formula", subtitle: "100% Fragrance Free"),
    ],
    reviewsSummary: ReviewSummary(
      averageRating: 4.7,
      totalReviews: 88,
      satisfactionPercent: 91,
      star5Percent: 80,
      star4Percent: 14,
      star3Percent: 6,
    ),
    featuredReview: UserReview(
      id: "rev_serum",
      reviewerName: "Niloufar B.",
      initials: "NB",
      isVerified: true,
      dateText: "1 week ago",
      comment: "Leaves my skin remarkably plump and refreshed without any tacky residue.",
      purchasedVariant: "Pure Dew",
      upvotes: 21,
      downvotes: 1,
    ),
  );

  static const ProductDetail sampleLampDetail = ProductDetail(
    id: "prod_lamp",
    brand: "Lumina Living",
    sku: "LP-102",
    title: "Modern Touch Rechargeable Bedside Lamp",
    subtitle: "Stepless Dimmable Warm Ambient Touch Light with USB-C",
    originalPrice: 36.00,
    currentPrice: 27.99,
    discountPercent: 22,
    rating: 4.9,
    reviewCount: 210,
    satisfactionPercent: 95,
    galleryImages: ["assets/images/product_lamp.jpg"],
    colors: [
      ColorVariant(id: "color_walnut", name: "Warm Walnut", color: Color(0xFFD97706)),
      ColorVariant(id: "color_slate", name: "Nordic Slate", color: Color(0xFF334155)),
      ColorVariant(id: "color_ivory", name: "Frosted Ivory", color: Color(0xFFF1F5F9)),
    ],
    highlights: [
      ProductHighlight(icon: Icons.battery_charging_full_outlined, title: "Type-C Battery", subtitle: "Up to 24h Playtime"),
      ProductHighlight(icon: Icons.devices_outlined, title: "Touch Sensitive", subtitle: "Smooth Stepless Dimmable"),
      ProductHighlight(icon: Icons.verified_outlined, title: "2700K Warm CRI90", subtitle: "Gentle on Eyes"),
    ],
    reviewsSummary: ReviewSummary(
      averageRating: 4.9,
      totalReviews: 210,
      satisfactionPercent: 95,
      star5Percent: 91,
      star4Percent: 6,
      star3Percent: 3,
    ),
    featuredReview: UserReview(
      id: "rev_lamp",
      reviewerName: "Farhad P.",
      initials: "FP",
      isVerified: true,
      dateText: "3 days ago",
      comment: "The ambient light is warm, soothing, and easily dims with a gentle touch.",
      purchasedVariant: "Warm Walnut",
      upvotes: 26,
      downvotes: 0,
    ),
  );

  static const ProductDetail sampleCaseDetail = ProductDetail(
    id: "deal_1_case",
    brand: "ShieldGear Pro",
    sku: "CS-504",
    title: "Silicone Protective Case",
    subtitle: "Shock-Absorbing Soft-Touch Earbud Protective Case",
    originalPrice: 12.00,
    currentPrice: 9.00,
    discountPercent: 25,
    rating: 4.5,
    reviewCount: 54,
    satisfactionPercent: 90,
    galleryImages: ["assets/images/product_case_peach.jpg"],
    colors: [
      ColorVariant(id: "color_case_peach", name: "Pastel Peach", color: Color(0xFFFFB3B6)),
      ColorVariant(id: "color_case_lilac", name: "Lilac Cloud", color: Color(0xFFE9D5FF)),
      ColorVariant(id: "color_case_navy", name: "Midnight Navy", color: Color(0xFF1E1B4B)),
    ],
    highlights: [
      ProductHighlight(icon: Icons.security_outlined, title: "Military Drop Tested", subtitle: "360° Impact Protection"),
      ProductHighlight(icon: Icons.verified_outlined, title: "Anti-Fingerprint", subtitle: "Soft Matte Touch"),
      ProductHighlight(icon: Icons.battery_charging_full_outlined, title: "Wireless Safe", subtitle: "Visible Front LED"),
    ],
    reviewsSummary: ReviewSummary(
      averageRating: 4.5,
      totalReviews: 54,
      satisfactionPercent: 90,
      star5Percent: 75,
      star4Percent: 18,
      star3Percent: 7,
    ),
    featuredReview: UserReview(
      id: "rev_case",
      reviewerName: "Hasti R.",
      initials: "HR",
      isVerified: true,
      dateText: "6 days ago",
      comment: "Fits snugly, provides great corner protection, and the peach color looks pastel and classy.",
      purchasedVariant: "Pastel Peach",
      upvotes: 11,
      downvotes: 0,
    ),
  );

  static ProductDetail getProductDetail(String productId) {
    switch (productId) {
      case "deal_3":
        return sampleHeadphoneDetail;
      case "deal_2":
        return sampleSmartwatchDetail;
      case "deal_1":
        return sampleEarbudsDetail;
      case "prod_keyboard":
        return sampleKeyboardDetail;
      case "prod_mug":
        return sampleMugDetail;
      case "prod_serum":
        return sampleSerumDetail;
      case "prod_lamp":
        return sampleLampDetail;
      default:
        return sampleHeadphoneDetail;
    }
  }

  // 8. Categories Collection for Split View
  static final List<CategoryCollection> categoryCollections = [
    CategoryCollection(
      id: "cat_digital",
      name: "Digital & Tech",
      icon: Icons.devices_outlined,
      bannerTag: "New Arrivals",
      bannerTitle: "Digital Gadgets",
      bannerSubtitle: "Next-gen audio & wearables",
      discountText: "UP TO 45% OFF",
      subcategories: const [
        SubCategory(id: "sub_headphones", name: "Headphones", itemCount: 42, icon: Icons.headphones_outlined),
        SubCategory(id: "sub_smartwatch", name: "Smartwatches", itemCount: 28, icon: Icons.watch_outlined),
        SubCategory(id: "sub_keyboard", name: "Keyboards", itemCount: 19, icon: Icons.keyboard_outlined),
        SubCategory(id: "sub_cases", name: "Accessories", itemCount: 56, icon: Icons.cases_outlined),
      ],
      products: const [
        Product(
          id: "deal_3",
          title: "Pro Sound Max ANC Headphones",
          originalPrice: 249.99,
          currentPrice: 149.99,
          discountPercent: 40,
          imagePath: "assets/images/product_headphones_main.jpg",
          rating: 4.8,
          reviewCount: 124,
          deliveryBadge: "Free Shipping",
        ),
        Product(
          id: "deal_2",
          title: "Ultra Leather Smartwatch Pro",
          originalPrice: 165.00,
          currentPrice: 118.80,
          discountPercent: 28,
          imagePath: "assets/images/product_smartwatch.jpg",
          rating: 4.7,
          reviewCount: 89,
          deliveryBadge: "Best Seller",
        ),
        Product(
          id: "deal_1",
          title: "Pro Sound Wireless Headphones 2024",
          originalPrice: 109.99,
          currentPrice: 59.99,
          discountPercent: 45,
          imagePath: "assets/images/product_earbuds.jpg",
          rating: 4.6,
          reviewCount: 92,
          deliveryBadge: "Hot Deal",
        ),
        Product(
          id: "prod_keyboard",
          title: "Retro Mechanical Wireless Keyboard",
          originalPrice: 89.00,
          currentPrice: 74.99,
          discountPercent: 16,
          imagePath: "assets/images/product_keyboard.jpg",
          rating: 4.9,
          reviewCount: 340,
          deliveryBadge: "18-Mo Warranty",
        ),
      ],
    ),
    CategoryCollection(
      id: "cat_fashion",
      name: "Fashion & Style",
      icon: Icons.checkroom_outlined,
      bannerTag: "Trending Now",
      bannerTitle: "Autumn Outfits",
      bannerSubtitle: "Modern minimalist fashion",
      discountText: "UP TO 35% OFF",
      subcategories: const [
        SubCategory(id: "sub_sneakers", name: "Footwear", itemCount: 34, icon: Icons.sports_score_outlined),
        SubCategory(id: "sub_outerwear", name: "Outerwear", itemCount: 25, icon: Icons.checkroom_outlined),
      ],
      products: const [
        Product(
          id: "prod_sneakers",
          title: "Comfort Sneakers Global Brands",
          originalPrice: 99.00,
          currentPrice: 64.00,
          discountPercent: 35,
          imagePath: "assets/images/banner_sneakers.jpg",
          rating: 4.8,
          reviewCount: 156,
          deliveryBadge: "Trending",
        ),
      ],
    ),
    CategoryCollection(
      id: "cat_home",
      name: "Home & Living",
      icon: Icons.kitchen_outlined,
      bannerTag: "Cozy Living",
      bannerTitle: "Home Aesthetics",
      bannerSubtitle: "Minimalist lighting & decor",
      discountText: "UP TO 25% OFF",
      subcategories: const [
        SubCategory(id: "sub_lighting", name: "Lighting", itemCount: 18, icon: Icons.lightbulb_outlined),
        SubCategory(id: "sub_drinkware", name: "Drinkware", itemCount: 22, icon: Icons.local_cafe_outlined),
      ],
      products: const [
        Product(
          id: "prod_lamp",
          title: "Modern Touch Rechargeable Bedside Lamp",
          originalPrice: 36.00,
          currentPrice: 27.99,
          discountPercent: 22,
          imagePath: "assets/images/product_lamp.jpg",
          rating: 4.9,
          reviewCount: 210,
          deliveryBadge: "Original",
        ),
        Product(
          id: "prod_mug",
          title: "Stainless Steel Travel Mug Alpha",
          originalPrice: 24.00,
          currentPrice: 18.50,
          discountPercent: 23,
          imagePath: "assets/images/product_tumbler.jpg",
          rating: 4.8,
          reviewCount: 124,
          deliveryBadge: "Free Shipping",
        ),
      ],
    ),
    CategoryCollection(
      id: "cat_beauty",
      name: "Beauty & Care",
      icon: Icons.spa_outlined,
      bannerTag: "Clean Formula",
      bannerTitle: "Skin Health",
      bannerSubtitle: "Dermatologist tested hydration",
      discountText: "UP TO 30% OFF",
      subcategories: const [
        SubCategory(id: "sub_skincare", name: "Skincare", itemCount: 15, icon: Icons.spa_outlined),
      ],
      products: const [
        Product(
          id: "prod_serum",
          title: "Deep Hydrating Hyaluronic Serum",
          originalPrice: 19.99,
          currentPrice: 15.20,
          discountPercent: 24,
          imagePath: "assets/images/product_serum.jpg",
          rating: 4.7,
          reviewCount: 88,
          deliveryBadge: "Free Shipping",
        ),
      ],
    ),
  ];

  // 9. Initial Default Cart Items
  static const List<CartItem> defaultCartItems = [
    CartItem(
      id: "item-1",
      productId: "deal_3",
      title: "Pro Sound Wireless Headphones",
      imagePath: "assets/images/product_headphones_main.jpg",
      colorName: "Color: Matte Black",
      colorHex: Color(0xFF1E293B),
      tagText: "18-month warranty",
      isTagPrimary: false,
      originalPrice: 70.00,
      currentPrice: 59.00,
      quantity: 1,
    ),
    CartItem(
      id: "item-2",
      productId: "deal_2",
      title: "Smart Watch Fit Pro",
      imagePath: "assets/images/product_smartwatch.jpg",
      colorName: "Strap: Graphite Silver",
      colorHex: Color(0xFFCBD5E1),
      tagText: "Best Seller",
      isTagPrimary: true,
      originalPrice: 55.00,
      currentPrice: 45.00,
      quantity: 2,
    ),
    CartItem(
      id: "item-3",
      productId: "deal_1",
      title: "Silicone Protective Case",
      imagePath: "assets/images/product_case_peach.jpg",
      colorName: "Color: Pastel Peach",
      colorHex: Color(0xFFFFB3B6),
      tagText: "Shockproof",
      isTagPrimary: false,
      originalPrice: 12.00,
      currentPrice: 9.00,
      quantity: 1,
    ),
  ];

  // 10. User Profile & Account Data
  static const UserProfile sampleUserProfile = UserProfile(
    name: "Sara Mohammadi",
    email: "sara@example.com",
    phone: "+1 (555) 345-6789",
    avatarPath: "assets/images/user_avatar.jpg",
    isVerified: true,
    memberTier: "Gold Member ★",
    walletBalance: 380.00,
    rewardPoints: 1450,
    activeCouponsCount: 3,
  );

  static const OrderStatusCount sampleOrderStatus = OrderStatusCount(
    processingCount: 1,
    deliveredCount: 24,
    cancelledCount: 2,
    returnedCount: 0,
  );

  static const ActiveDelivery sampleActiveDelivery = ActiveDelivery(
    orderId: "348902",
    statusText: "Arriving Tomorrow",
    subtext: "In transit from sorting facility",
  );

  static const List<ProfileMenuItem> profileMenuItems = [
    ProfileMenuItem(
      id: "orders",
      title: "Order History",
      subtitle: "Track packages and receipts",
      icon: Icons.shopping_bag_outlined,
    ),
    ProfileMenuItem(
      id: "wishlist",
      title: "Wishlist & Saved Items",
      subtitle: "Saved products and in-stock alerts",
      icon: Icons.favorite_border,
      badgeText: "12 items",
    ),
    ProfileMenuItem(
      id: "addresses",
      title: "Shipping Addresses",
      subtitle: "Manage delivery addresses",
      icon: Icons.location_on_outlined,
    ),
    ProfileMenuItem(
      id: "messages",
      title: "Messages & Alerts",
      subtitle: "Discounts, updates, and account status",
      icon: Icons.mail_outline,
      badgeText: "2 new",
      isHighlightedBadge: true,
    ),
    ProfileMenuItem(
      id: "support",
      title: "Help & Customer Support",
      subtitle: "24/7 online support",
      icon: Icons.headset_mic_outlined,
    ),
    ProfileMenuItem(
      id: "settings",
      title: "Account & Privacy Settings",
      subtitle: "Password, security, active sessions",
      icon: Icons.security_outlined,
    ),
  ];
}

