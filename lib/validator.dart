class Validator {
  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'You have not entered your email';
    }
    return value;
  }

  static String validatePassword(String value) {
    if (value.isEmpty) {
      return 'You have not entered your password';
    }

    if (value.length < 7) {
      return 'Password does not meet required length';
    }
    return value;
  }
}
