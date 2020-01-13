import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('test app Bukata', () {
    FlutterDriver driver;

    setUpAll(() async{
    driver = await FlutterDriver.connect();
    });
    
    tearDownAll(() {
      if(driver != null) {
        driver.close();
      }
    });

    var emailField = find.byValueKey('emailTextField');
    var passwordField = find.byValueKey('passwordTextField');
    var submitButton = find.byValueKey('submitButton');

    test('ensure email and password field exists', () async{
      await driver.tap(emailField);
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText('admin@mail.com');
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(passwordField);
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText('abcdefgh');
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(submitButton);
      await Future.delayed(Duration(seconds: 2));
      await driver.waitUntilNoTransientCallbacks();

    });
  });
}