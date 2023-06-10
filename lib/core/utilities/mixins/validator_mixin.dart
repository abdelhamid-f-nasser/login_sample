
mixin EmailValidatorMixin {
  String? validateEmail(String? email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!regex.hasMatch(email ?? '')) {
      return 'Please enter a valid email address';
    }
    return null;
  }
}

mixin PasswordValidatorMixin {
  String? validatePassword(String? password) {
    final regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!regex.hasMatch(password ?? '')) {
      return 'Please enter a valid password';
    }
    return null;
  }
}
