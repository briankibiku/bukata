import 'package:bukata/home.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  Widget makeTestableWidget ({Widget child}){
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('should test HomePage widget', (WidgetTester tester) async {

    final childWidget = MainAxisAlignment.center;
    await tester.pumpWidget(makeTestableWidget(child: HomePage()));
    var column = find.byType(Column);

    expect(column, findsOneWidget);
  });
}