import 'package:bukata/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('should confirm MyApp and LandingPage widgets exist', (WidgetTester tester) async {

    await tester.pumpWidget(makeTestableWidget(child: LandingPage()));
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(FlatButton));
    await tester.pump();
    await tester.enterText(find.byKey(Key('emailTextField')), 'admin@mail.com');
    await tester.enterText(find.byKey(Key('passwordTextField')), 'abcdef');

    var submitButton = find.byType(FlatButton);
    expect(submitButton, findsNWidgets(2));
    
  });
}
