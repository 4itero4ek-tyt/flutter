import 'package:flutter_test/flutter_test.dart';
import 'package:pr1/main.dart';

void main() {
  testWidgets('четыре макета', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('medinow'), findsOneWidget);

    await tester.tap(find.text('Meditate'));
    await tester.pumpAndSettle();
    expect(find.text('A Song of Moon'), findsOneWidget);

    await tester.tap(find.text('Wallet'));
    await tester.pumpAndSettle();
    expect(find.text('My E-Wallet'), findsOneWidget);

    await tester.tap(find.text('Organizer'));
    await tester.pumpAndSettle();
    expect(find.text('Albert Flores'), findsOneWidget);
  });
}
