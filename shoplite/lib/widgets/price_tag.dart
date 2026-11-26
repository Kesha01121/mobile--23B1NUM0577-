import 'package:flutter/material.dart';
import '../models/product.dart';

class PriceTag extends StatelessWidget {
  final Product product;

  const PriceTag({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasDiscount = product.discountPercentage > 0;
    final currentText = '\$${product.discountedPrice.toStringAsFixed(2)}';
    final originalText = '\$${product.price.toStringAsFixed(2)}';

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 6,
      runSpacing: 2,
      children: [
        Text(
          currentText,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (hasDiscount)
          Text(
            originalText,
            style: theme.textTheme.bodySmall?.copyWith(
              decoration: TextDecoration.lineThrough,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}
