// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/app/vision3_app.dart';

void main() {
  testWidgets('Vision3 app renders continue watching page', (WidgetTester tester) async {
    await tester.pumpWidget(const Vision3App());

    expect(find.text('계속 시청하기'), findsOneWidget);
  });
}