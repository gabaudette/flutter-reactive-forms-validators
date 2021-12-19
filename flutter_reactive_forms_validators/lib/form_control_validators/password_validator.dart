import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_reactive_forms_validators/validation_message/validation_message.dart' as Vm;

/// Validator that requires the control's value to be a valid password based on a password regex
class PasswordValidator extends Validator<dynamic> {
  final _passwordRegex = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}");

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final value = control.value;
    return {
      if (!_passwordRegex.hasMatch(value ?? "")) Vm.ValidationMessage.password: true,
    };
  }
}