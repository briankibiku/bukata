import 'package:bukata/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
      // routes: {'/LandingPaeg': (context) => LandingPage(),
      // '/Home': (context) => HomePage(),},
    );
  }

  testWidgets('should confirm MyApp and LandingPage widgets exist', (WidgetTester tester) async {

    await tester.pumpWidget(makeTestableWidget(child: LandingPage()));
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byType(FlatButton));
    await tester.pump();
    // await tester.enterText(find.byType(TextField), 'admin@mail.com');
    await tester.enterText(find.byKey(Key('emailTextField')), 'admin@mail.com');
    await tester.enterText(find.byKey(Key('passwordTextField')), 'abcdef');

    // var emailLabel = find.text('Enter email');
    // var passwordLabel = find.text('Enter password');
    var submitButton = find.byType(FlatButton);
    // expect(emailLabel, findsOneWidget);
    // expect(passwordLabel, findsOneWidget);
    expect(submitButton, findsNWidgets(2));
    
  });
}
