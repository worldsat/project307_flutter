import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../models/models.dart';
import '../../state/app_state.dart';
import '../../theme/app_colors.dart';
import 'components/home_top_bar.dart';
import 'components/home_search_bar.dart';
import 'components/trust_badges_strip.dart';
import 'components/hero_promo_banner.dart';
import 'components/category_chips.dart';
import 'components/flash_deals_section.dart';
import 'components/editorial_banners.dart';
import 'components/best_sellers_grid.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<String> onProductClick;
  final VoidCallback onViewAllCategories;

  const HomeScreen({
    super.key,
    required this.onProductClick,
    required this.onViewAllCategories,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = "";
  String _selectedCategoryId = "cat_digital";

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: HomeTopBar(
        onNotificationsClick: () {
          appState.showToast("No new notifications");
        },
        onBrandBagClick: () {
          appState.setTab(BottomNavTab.cart);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeSearchBar(
              query: _searchQuery,
              onQueryChanged: (val) {
                setState(() => _searchQuery = val);
              },
              onScanBarcodeClick: () {
                appState.showToast("Barcode scanner opened");
              },
              onFilterClick: () {
                appState.showToast("Filter settings opened");
              },
            ),
            const TrustBadgesStrip(badges: MockData.trustBadges),
            HeroPromoBanner(
              banner: MockData.heroPromoBanner,
              hours: appState.countdownHours,
              minutes: appState.countdownMinutes,
              seconds: appState.countdownSeconds,
              onShopNowClick: () => widget.onProductClick("deal_3"),
            ),
            FeaturedCategoriesSection(
              categories: MockData.categories,
              selectedCategoryId: _selectedCategoryId,
              onCategoryClick: (catId) {
                setState(() => _selectedCategoryId = catId);
                widget.onViewAllCategories();
              },
              onViewAllClick: widget.onViewAllCategories,
            ),
            FlashDealsSection(
              deals: MockData.flashDeals,
              onProductClick: widget.onProductClick,
              onViewAllClick: () {
                appState.showToast("Showing all flash deals");
              },
            ),
            const EditorialBannersSection(banners: MockData.editorialBanners),
            BestSellersSection(
              products: MockData.bestSellers,
              onProductClick: widget.onProductClick,
              onToggleFavorite: (id) => appState.toggleFavorite(id),
              onAddToCart: (prod) => appState.addToCartFromProduct(prod),
              onFilterSortClick: () {
                appState.showToast("Sort options: Price, Popularity");
              },
              isFavorite: (id) => appState.isFavorite(id),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
