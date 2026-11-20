import 'package:flutter/material.dart';

void main() {
  runApp(const ShopLiteApp());
}

class ShopLiteApp extends StatelessWidget {
  const ShopLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopLite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ShopLiteHomePage(),
    );
  }
}

class ShopLiteHomePage extends StatefulWidget {
  const ShopLiteHomePage({super.key});

  @override
  State<ShopLiteHomePage> createState() => _ShopLiteHomePageState();
}

class _ShopLiteHomePageState extends State<ShopLiteHomePage> {
  int _count = 0;

  void _increment() {
    if (_count < 10) {
      setState(() => _count++);
    }
  }

  void _decrement() {
    if (_count > 0) {
      setState(() => _count--);
    }
  }

  void _reset() {
    setState(() => _count = 0);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopLite — Сагс'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Badge(
                label: Text('$_count'),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
          IconButton(
            onPressed: _reset,
            icon: const Icon(Icons.refresh),
            tooltip: 'Сагс хоослох',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Сагсанд байгаа бараа:'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_count >= 10)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  'Нэг удаад 10-аас олон бараа захиалах боломжгүй',
                  style: TextStyle(
                    color: colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: _count < 10 ? _increment : null,
            tooltip: 'Нэмэх',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: _count > 0 ? _decrement : null,
            tooltip: 'Хасах',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}