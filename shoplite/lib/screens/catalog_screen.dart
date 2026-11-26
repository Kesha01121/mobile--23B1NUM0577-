import 'package:flutter/material.dart';
import '../core/catalog_utils.dart';
import '../data/sample_products.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class CatalogScreen extends StatefulWidget {
  final List<Product> products;
  final ValueChanged<Product>? onProductTap;

  const CatalogScreen({
    super.key,
    this.products = sampleProducts,
    this.onProductTap,
  });

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _query = '';
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final categories = categoriesOf(widget.products);
    final visible = filterProducts(
      widget.products,
      category: _selectedCategory,
      query: _query,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Бараа хайх',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _query = value;
                });
              },
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: const Text('Бүгд'),
                    selected: _selectedCategory == null,
                    onSelected: (_) {
                      setState(() {
                        _selectedCategory = null;
                      });
                    },
                  ),
                ),
                for (final category in categories)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: _selectedCategory == category,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategory = selected ? category : null;
                        });
                      },
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: visible.isEmpty
                ? const Center(child: Text('Бараа олдсонгүй'))
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = gridColumnCount(constraints.maxWidth);
                      return GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.62,
                        ),
                        itemCount: visible.length,
                        itemBuilder: (context, index) {
                          final product = visible[index];
                          return ProductCard(
                            product: product,
                            onTap: () => widget.onProductTap?.call(product),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
