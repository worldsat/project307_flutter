import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../models/models.dart';
import '../../state/app_state.dart';
import '../../theme/app_colors.dart';
import 'components/detail_top_bar.dart';
import 'components/gallery_section.dart';
import 'components/metadata_section.dart';
import 'components/color_picker.dart';
import 'components/highlights_section.dart';
import 'components/warranty_section.dart';
import 'components/reviews_section.dart';
import 'components/sticky_cart_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  final VoidCallback onBack;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.onBack,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedGalleryIndex = 0;
  int _selectedColorIndex = 0;
  int _selectedWarrantyIndex = 0;
  bool _isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    final detail = MockData.getProductDetail(widget.productId);
    final isFav = appState.isFavorite(detail.id);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: ProductDetailTopBar(
        isFavorite: isFav,
        onBackClick: widget.onBack,
        onShareClick: () {
          appState.showToast("Link copied to clipboard ✓");
        },
        onToggleFavorite: () => appState.toggleFavorite(detail.id),
        onBagClick: () {
          appState.setTab(BottomNavTab.cart);
          widget.onBack();
        },
      ),
      bottomNavigationBar: StickyAddToCartBar(
        originalPrice: detail.originalPrice,
        currentPrice: detail.currentPrice,
        discountPercent: detail.discountPercent,
        isAddedToCart: _isAddedToCart,
        onAddToCartClick: () {
          final selectedColor = detail.colors.isNotEmpty ? detail.colors[_selectedColorIndex] : null;
          appState.addToCartFromDetail(detail, selectedColor: selectedColor);
          setState(() => _isAddedToCart = true);
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) setState(() => _isAddedToCart = false);
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductGallerySection(
              galleryImages: detail.galleryImages,
              selectedIndex: _selectedGalleryIndex,
              isFavorite: isFav,
              onSelectImage: (index) {
                setState(() => _selectedGalleryIndex = index);
              },
              onShareClick: () {
                appState.showToast("Product link copied");
              },
              onToggleFavorite: () => appState.toggleFavorite(detail.id),
            ),
            ProductMetadataSection(detail: detail),
            ColorVariantPicker(
              colors: detail.colors,
              selectedIndex: _selectedColorIndex,
              onSelectColor: (index) {
                setState(() => _selectedColorIndex = index);
              },
            ),
            KeyHighlightsSection(highlights: detail.highlights),
            WarrantyAndCareSection(
              selectedWarrantyIndex: _selectedWarrantyIndex,
              onSelectWarranty: (index) {
                setState(() => _selectedWarrantyIndex = index);
              },
            ),
            CustomerReviewsSection(
              summary: detail.reviewsSummary,
              featuredReview: detail.featuredReview,
              onWriteReviewClick: () {
                appState.showToast("Review form opened");
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
