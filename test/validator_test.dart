import 'package:flutter_test/flutter_test.dart';
import 'package:bukata/validator.dart';

void main () {
  
  test('test if email is present', () {
    // var passLength = 6;
    var emailError = Validator.validateEmail('');
    var passwordError = Validator.validatePassword('');
    var passValid = Validator.validatePassword('12324');

    expect(emailError, 'You have not entered your password');
    expect(passwordError, 'You have not entered your password');
    expect(passValid, 'Password does not meet required length');
  });
}