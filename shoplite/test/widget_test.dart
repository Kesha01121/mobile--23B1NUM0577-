import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoplite/main.dart';

void main() {
  testWidgets('ShopLite сагсны тоолуур нэмэх ба хасах тест', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ShopLiteApp());

    // 0 утга дэлгэцийн голд болон сагсны Badge дээр нийт 2 газар харагдана
    expect(find.text('0'), findsNWidgets(2));

    // '+' дарахад 1 болно
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsNWidgets(2));

    // '−' дарахад буцаад 0 болно
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('0'), findsNWidgets(2));

    // 0 дээр байхад дахин '−' дарахад -1 болохгүй, 0 хэвээр үлдэнэ
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('0'), findsNWidgets(2));
  });
}