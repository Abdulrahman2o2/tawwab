import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tawwab/app/colors.dart';

void main() {
  testWidgets('Brand colors are defined', (tester) async {
    expect(TawwabColors.primary.toARGB32(), isA<int>());
    expect(TawwabColors.accent.toARGB32(), isA<int>());
  });

  testWidgets('A simple card renders with brand accent', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Icon(Icons.balance, color: TawwabColors.accent),
        ),
      ),
    );
    expect(find.byIcon(Icons.balance), findsOneWidget);
  });
}
