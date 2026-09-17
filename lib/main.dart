import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/models.dart';
import 'screens/cart/cart_screen.dart';
import 'screens/categories/categories_screen.dart';
import 'screens/detail/product_detail_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'state/app_state.dart';
import 'theme/app_theme.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/feedback_toast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const ModernEcommerceApp());
}

class ModernEcommerceApp extends StatefulWidget {
  const ModernEcommerceApp({super.key});

  @override
  State<ModernEcommerceApp> createState() => _ModernEcommerceAppState();
}

class _ModernEcommerceAppState extends State<ModernEcommerceApp> {
  late final AppState _appState;

  @override
  void initState() {
    super.initState();
    _appState = AppState();
  }

  @override
  void dispose() {
    _appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      notifier: _appState,
      child: MaterialApp(
        title: "Modern E-Commerce",
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const MainShellScreen(),
      ),
    );
  }
}

class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key});

  void _navigateToDetail(BuildContext context, String productId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          productId: productId,
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);

    Widget buildCurrentTab() {
      switch (appState.selectedTab) {
        case BottomNavTab.home:
          return HomeScreen(
            onProductClick: (id) => _navigateToDetail(context, id),
            onViewAllCategories: () => appState.setTab(BottomNavTab.categories),
          );
        case BottomNavTab.categories:
          return CategoriesScreen(
            onProductClick: (id) => _navigateToDetail(context, id),
          );
        case BottomNavTab.cart:
          return CartScreen(
            onProductClick: (id) => _navigateToDetail(context, id),
            onStartShopping: () => appState.setTab(BottomNavTab.home),
          );
        case BottomNavTab.profile:
          return const ProfileScreen();
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          buildCurrentTab(),
          FeedbackToast(message: appState.toastMessage),
        ],
      ),
      bottomNavigationBar: StoreBottomNavBar(
        selectedTab: appState.selectedTab,
        cartItemCount: appState.totalUniqueItems,
        onTabSelected: (tab) => appState.setTab(tab),
      ),
    );
  }
}
