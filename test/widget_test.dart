import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_flutter/main.dart';

void main() {
  testWidgets('App inicializa corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());
    await tester.pumpAndSettle();

    expect(find.byType(TodoApp), findsOneWidget);
  });
}
