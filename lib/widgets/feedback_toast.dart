import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FeedbackToast extends StatelessWidget {
  final String? message;

  const FeedbackToast({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    if (message == null) return const SizedBox.shrink();

    return Positioned(
      bottom: 24,
      left: 20,
      right: 20,
      child: Center(
        child: Material(
          elevation: 8,
          shadowColor: Colors.black.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(14),
          color: AppColors.inverseSurface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.primaryContainer,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    message!,
                    style: const TextStyle(
                      color: AppColors.inverseOnSurface,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
