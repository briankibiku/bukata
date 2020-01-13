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

    final testKey = Key('emailTextField');

    await tester.pumpWidget(makeTestableWidget(child: MyApp()));
    await tester.pumpWidget(makeTestableWidget(child: LandingPage()));

      // var emailTextField = find.byKey(Key('emailTextField'));
      // expect(emailTextField, findsOneWidget);
      // await tester.enterText(emailTextField, 'main@mail.com');
      // expect(find.text('main@mail.com'), findsOneWidget);
      expect(find.byKey(testKey), findsOneWidget);

  });

  // testWidgets('should find the container widget', (WidgetTester tester) async{
  //   final containerWidget = Container();
  //   await tester.pumpWidget(makeTestableWidget(child: containerWidget));
  // });
}
