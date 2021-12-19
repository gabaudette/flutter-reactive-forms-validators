import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_reactive_forms_validators/validation_message/validation_message.dart' as Vm;

/// Represents the [EveryValidator] test function definition.
typedef EveryValidatorFunctionTest<T> = bool Function(T value);

/// Represents a validator that requires every element of the control's iterable
/// value satisfies [test].
class EveryValidator<T> extends Validator<dynamic> {
  final EveryValidatorFunctionTest<T> test;
  EveryValidator(this.test);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == null) {
      return <String, dynamic>{Vm.ValidationMessage.every: true};
    }

    final iterable = control.value as Iterable<T>;
    return iterable.any(test)
        ? null
        : <String, dynamic>{Vm.ValidationMessage.every: true};
  }
}
