import 'package:bukata/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('should test if home page widget is present', (WidgetTester tester) async{
    await tester.pumpWidget(makeTestableWidget(child:HomePage()));

    await tester.tap(find.byType(FlatButton));
    await tester.enterText(find.byType(TextFormField), 'Hello');
  });
}