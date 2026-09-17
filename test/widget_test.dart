import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/detail/product_detail_screen.dart';
import 'package:flutter_app/state/app_state.dart';
import 'package:flutter_app/theme/app_theme.dart';

void main() {
  testWidgets('App smoke test mounts home screen with all sections', (WidgetTester tester) async {
    await tester.pumpWidget(const ModernEcommerceApp());
    await tester.pump();

    // Verify Home Top Bar & Key Sections
    expect(find.text('Home'), findsWidgets);
    expect(find.text('Search among thousands of products...'), findsOneWidget);
    expect(find.text('Flash Deals'), findsOneWidget);
    expect(find.text('Best Sellers'), findsOneWidget);
  });

  testWidgets('Tab navigation switches between screens properly', (WidgetTester tester) async {
    await tester.pumpWidget(const ModernEcommerceApp());
    await tester.pump();

    // 1. Navigate to Categories Tab
    await tester.tap(find.text('Categories'));
    await tester.pumpAndSettle();
    expect(find.text('Categories'), findsWidgets);

    // 2. Navigate to Cart Tab
    await tester.tap(find.text('Cart'));
    await tester.pumpAndSettle();
    expect(find.text('Cart'), findsWidgets);
    expect(find.text('Your order qualifies for Free Delivery!'), findsOneWidget);

    // 3. Navigate to Profile Tab
    await tester.tap(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsWidgets);
    expect(find.text('Sara Mohammadi'), findsOneWidget);
    expect(find.text('My Orders'), findsOneWidget);
    expect(find.text('Log Out of Account'), findsOneWidget);
  });

  testWidgets('ProductDetailScreen mounts and displays full details', (WidgetTester tester) async {
    final appState = AppState();

    await tester.pumpWidget(
      AppStateScope(
        notifier: appState,
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: ProductDetailScreen(
            productId: 'prod_headphones',
            onBack: () {},
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Special Deal / Best Offer'), findsOneWidget);
    expect(find.text('Selected Color:'), findsOneWidget);
    expect(find.text('Key Product Highlights'), findsOneWidget);
    expect(find.text('Warranty & Customer Care'), findsOneWidget);
    expect(find.text('Customer Reviews'), findsOneWidget);
    expect(find.text('Add to Cart'), findsOneWidget);
    appState.dispose();
  });
}
