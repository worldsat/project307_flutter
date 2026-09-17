import 'dart:async';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/mock_data.dart';

class AppState extends ChangeNotifier {
  BottomNavTab _selectedTab = BottomNavTab.home;
  final List<CartItem> _cartItems = List.from(MockData.defaultCartItems);
  final Set<String> _favorites = {"prod_keyboard", "deal_3"};
  String? _appliedCoupon;
  String? _couponError;
  String? _toastMessage;
  Timer? _toastTimer;
  Timer? _countdownTimer;
  int _remainingSeconds = MockData.heroPromoBanner.remainingSeconds;

  AppState() {
    _startCountdown();
  }

  // Getters
  BottomNavTab get selectedTab => _selectedTab;
  List<CartItem> get cartItems => List.unmodifiable(_cartItems);
  Set<String> get favorites => Set.unmodifiable(_favorites);
  String? get appliedCoupon => _appliedCoupon;
  String? get couponError => _couponError;
  String? get toastMessage => _toastMessage;
  int get remainingSeconds => _remainingSeconds;

  int get countdownHours => _remainingSeconds ~/ 3600;
  int get countdownMinutes => (_remainingSeconds % 3600) ~/ 60;
  int get countdownSeconds => _remainingSeconds % 60;

  int get totalItemUnits => _cartItems.fold(0, (sum, item) => sum + item.quantity);
  int get totalUniqueItems => _cartItems.length;

  double get subtotal => _cartItems.fold(
        0.0,
        (sum, item) => sum + (item.originalPrice * item.quantity),
      );

  double get discountedSubtotal => _cartItems.fold(
        0.0,
        (sum, item) => sum + (item.currentPrice * item.quantity),
      );

  double get discountSavings => subtotal - discountedSubtotal;

  double get couponDiscount {
    if (_appliedCoupon == null) return 0.0;
    if (_appliedCoupon == "FALL1403") {
      return discountedSubtotal * 0.30;
    }
    return 10.0;
  }

  double get totalPayable {
    final net = discountedSubtotal - couponDiscount;
    return net > 0 ? net : 0.0;
  }

  void _startCountdown() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void setTab(BottomNavTab tab) {
    if (_selectedTab != tab) {
      _selectedTab = tab;
      notifyListeners();
    }
  }

  void toggleFavorite(String productId) {
    if (_favorites.contains(productId)) {
      _favorites.remove(productId);
      showToast("Removed from wishlist");
    } else {
      _favorites.add(productId);
      showToast("Added to wishlist ❤️");
    }
    notifyListeners();
  }

  bool isFavorite(String productId) => _favorites.contains(productId);

  void addToCartFromProduct(Product product, {ColorVariant? selectedColor}) {
    final existingIndex = _cartItems.indexWhere((i) => i.productId == product.id);
    if (existingIndex >= 0) {
      _cartItems[existingIndex] = _cartItems[existingIndex].copyWith(
        quantity: _cartItems[existingIndex].quantity + 1,
      );
    } else {
      _cartItems.add(
        CartItem(
          id: "item-${DateTime.now().millisecondsSinceEpoch}",
          productId: product.id,
          title: product.title,
          imagePath: product.imagePath,
          colorName: selectedColor != null ? "Color: ${selectedColor.name}" : "Default",
          colorHex: selectedColor?.color ?? const Color(0xFF1E293B),
          tagText: product.badgeText ?? "In Stock",
          isTagPrimary: product.badgeText != null,
          originalPrice: product.originalPrice,
          currentPrice: product.currentPrice,
          quantity: 1,
        ),
      );
    }
    showToast("Added ${product.title} to cart 🛍️");
    notifyListeners();
  }

  void addToCartFromDetail(ProductDetail detail, {ColorVariant? selectedColor}) {
    final existingIndex = _cartItems.indexWhere((i) => i.productId == detail.id);
    if (existingIndex >= 0) {
      _cartItems[existingIndex] = _cartItems[existingIndex].copyWith(
        quantity: _cartItems[existingIndex].quantity + 1,
      );
    } else {
      _cartItems.add(
        CartItem(
          id: "item-${DateTime.now().millisecondsSinceEpoch}",
          productId: detail.id,
          title: detail.title,
          imagePath: detail.galleryImages.isNotEmpty ? detail.galleryImages.first : "assets/images/product_headphones_main.jpg",
          colorName: selectedColor != null ? "Color: ${selectedColor.name}" : (detail.colors.isNotEmpty ? "Color: ${detail.colors.first.name}" : "Default"),
          colorHex: selectedColor?.color ?? (detail.colors.isNotEmpty ? detail.colors.first.color : const Color(0xFF1E293B)),
          tagText: "${detail.discountPercent}% OFF",
          isTagPrimary: true,
          originalPrice: detail.originalPrice,
          currentPrice: detail.currentPrice,
          quantity: 1,
        ),
      );
    }
    showToast("Added to cart 🛍️");
    notifyListeners();
  }

    void updateQuantity(String itemId, int delta) {
    if (delta > 0) {
      incrementQuantity(itemId);
    } else if (delta < 0) {
      decrementQuantity(itemId);
    }
  }

  void incrementQuantity(String itemId) {
    final index = _cartItems.indexWhere((i) => i.id == itemId);
    if (index >= 0) {
      _cartItems[index] = _cartItems[index].copyWith(
        quantity: _cartItems[index].quantity + 1,
      );
      notifyListeners();
    }
  }

  void decrementQuantity(String itemId) {
    final index = _cartItems.indexWhere((i) => i.id == itemId);
    if (index >= 0) {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index] = _cartItems[index].copyWith(
          quantity: _cartItems[index].quantity - 1,
        );
      } else {
        _cartItems.removeAt(index);
        showToast("Item removed from cart");
      }
      notifyListeners();
    }
  }

  void removeCartItem(String itemId) {
    _cartItems.removeWhere((i) => i.id == itemId);
    showToast("Item removed from cart");
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    showToast("Cart cleared");
    notifyListeners();
  }

  bool applyCoupon(String code) {
    final cleanCode = code.trim().toUpperCase();
    if (cleanCode.isEmpty) {
      _couponError = "Please enter a promo code";
      notifyListeners();
      return false;
    }

    if (cleanCode == "FALL1403" || cleanCode == "SAVE10" || cleanCode == "WELCOME") {
      _appliedCoupon = cleanCode;
      _couponError = null;
      showToast("Coupon '$cleanCode' applied successfully! 🎉");
      notifyListeners();
      return true;
    } else {
      _couponError = "Invalid promo code '$code'";
      showToast("Invalid promo code");
      notifyListeners();
      return false;
    }
  }

  void removeCoupon() {
    _appliedCoupon = null;
    _couponError = null;
    notifyListeners();
  }

  void showToast(String message) {
    _toastTimer?.cancel();
    _toastMessage = message;
    notifyListeners();

    _toastTimer = Timer(const Duration(seconds: 3), () {
      _toastMessage = null;
      notifyListeners();
    });
  }

  void clearToast() {
    _toastMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _toastTimer?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }
}

// InheritedWidget wrapper for easy access without 3rd party state packages
class AppStateScope extends InheritedNotifier<AppState> {
  const AppStateScope({
    super.key,
    required AppState notifier,
    required super.child,
  }) : super(notifier: notifier);

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, "No AppStateScope found in context");
    return scope!.notifier!;
  }
}

