import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/dimens.dart';
import '../constants/styles.dart';
import '../utils/animations.dart';

class PremiumProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String color;
  final VoidCallback onTap;

  const PremiumProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.onTap,
  });

  @override
  State<PremiumProductCard> createState() => _PremiumProductCardState();
}

class _PremiumProductCardState extends State<PremiumProductCard> {
  bool _isHovering = false;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppAnimations.medium,
          width: AppDimens.productCardWidth,
          margin: const EdgeInsets.only(right: AppDimens.marginMedium),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_isHovering ? 0.2 : 0.1),
                blurRadius: _isHovering ? 16 : 8,
                spreadRadius: 0,
                offset: Offset(0, _isHovering ? 6 : 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusLarge),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Container(
                      height: AppDimens.productImageHeight,
                      width: double.infinity,
                      color: AppColors.surface,
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 40,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ),
                    // Product Info
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.paddingMedium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: AppTextStyles.bodyLarge.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${widget.price}',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.textOnPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppDimens.borderRadiusMedium,
                                  ),
                                ),
                              ),
                              onPressed: widget.onTap,
                              child: const Text('View Details'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Favorite Button
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: _isFavorite ? AppColors.error : AppColors.surface,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                  ),
                ),
                // Color Indicator
                if (widget.color.isNotEmpty)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: _parseColor(widget.color),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.surface,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _parseColor(String color) {
    try {
      return Color(int.parse(color.replaceFirst('#', '0xFF')));
    } catch (e) {
      return Colors.grey;
    }
  }
}