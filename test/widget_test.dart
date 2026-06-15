import 'package:flutter_test/flutter_test.dart';
import 'package:module_13_assignment/app.dart';

void main() {
  testWidgets('App opens properly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Counter value'), findsOneWidget);
    expect(find.text('Increment'), findsOneWidget);
    expect(find.text('Open Details'), findsOneWidget);
  });
}