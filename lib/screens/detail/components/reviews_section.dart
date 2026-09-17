import 'package:flutter/material.dart';
import '../../../models/models.dart';
import '../../../theme/app_colors.dart';

class CustomerReviewsSection extends StatefulWidget {
  final ReviewSummary summary;
  final UserReview featuredReview;
  final VoidCallback onWriteReviewClick;

  const CustomerReviewsSection({
    super.key,
    required this.summary,
    required this.featuredReview,
    required this.onWriteReviewClick,
  });

  @override
  State<CustomerReviewsSection> createState() => _CustomerReviewsSectionState();
}

class _CustomerReviewsSectionState extends State<CustomerReviewsSection> {
  int _upvotes = 42;
  int _downvotes = 3;
  bool _hasUpvoted = false;
  bool _hasDownvoted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Customer Reviews",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      "${widget.summary.totalReviews}",
                      style: const TextStyle(
                        color: AppColors.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: widget.onWriteReviewClick,
                child: const Row(
                  children: [
                    Text(
                      "Write Review",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.primary,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Visual Rating Bar Summary Card
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surfaceBright,
              borderRadius: BorderRadius.circular(14),
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
                // Left rating score
                Column(
                  children: [
                    Text(
                      "${widget.summary.averageRating}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.onSurface,
                        fontSize: 32,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < 4; i++)
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.secondaryContainer,
                            size: 14,
                          ),
                        const Icon(
                          Icons.star_half_rounded,
                          color: AppColors.secondaryContainer,
                          size: 14,
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "out of 5",
                      style: TextStyle(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),

                // Right Bars
                Expanded(
                  child: Column(
                    children: [
                      _buildRatingBarRow("5 stars", widget.summary.star5Percent),
                      const SizedBox(height: 6),
                      _buildRatingBarRow("4 stars", widget.summary.star4Percent),
                      const SizedBox(height: 6),
                      _buildRatingBarRow("3 stars", widget.summary.star3Percent),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Featured Real Review Card
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surfaceBright,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Reviewer Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryFixed,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            widget.featuredReview.initials,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.onPrimaryFixed,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.featuredReview.reviewerName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.onSurface,
                                fontSize: 13,
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.check_circle_rounded,
                                  color: AppColors.secondary,
                                  size: 12,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  "Verified Buyer",
                                  style: TextStyle(
                                    color: AppColors.secondary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.featuredReview.dateText,
                      style: const TextStyle(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Review Comment
                Text(
                  widget.featuredReview.comment,
                  style: const TextStyle(
                    color: AppColors.onSurface,
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 8),

                // Footer Row: Variant + Upvote/Downvote
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Color purchased: ${widget.featuredReview.purchasedVariant}",
                      style: const TextStyle(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 11,
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_hasUpvoted) {
                                _upvotes--;
                                _hasUpvoted = false;
                              } else {
                                _upvotes++;
                                _hasUpvoted = true;
                                if (_hasDownvoted) {
                                  _downvotes--;
                                  _hasDownvoted = false;
                                }
                              }
                            });
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thumb_up_rounded,
                                  size: 14,
                                  color: _hasUpvoted ? AppColors.primary : AppColors.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "$_upvotes",
                                  style: TextStyle(
                                    color: _hasUpvoted ? AppColors.primary : AppColors.onSurfaceVariant,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_hasDownvoted) {
                                _downvotes--;
                                _hasDownvoted = false;
                              } else {
                                _downvotes++;
                                _hasDownvoted = true;
                                if (_hasUpvoted) {
                                  _upvotes--;
                                  _hasUpvoted = false;
                                }
                              }
                            });
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.thumb_down_rounded,
                                  size: 14,
                                  color: _hasDownvoted ? AppColors.primary : AppColors.onSurfaceVariant,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "$_downvotes",
                                  style: TextStyle(
                                    color: _hasDownvoted ? AppColors.primary : AppColors.onSurfaceVariant,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBarRow(String starLabel, int percent) {
    return Row(
      children: [
        SizedBox(
          width: 42,
          child: Text(
            starLabel,
            style: const TextStyle(
              color: AppColors.onSurfaceVariant,
              fontSize: 11,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 6,
              color: AppColors.surfaceContainerHigh,
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: (percent / 100).clamp(0.0, 1.0),
                child: Container(
                  color: AppColors.secondary,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 28,
          child: Text(
            "$percent%",
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: AppColors.onSurfaceVariant,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}
