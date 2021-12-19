import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_reactive_forms_validators/validation_message/validation_message.dart' as Vm;

/// Represents the [EveryValidator] test function definition.
typedef UniqueValidatorFunctionTest<T> = bool Function(T value);

/// Represents a validator that requires every element of the control's iterable to be unique
class UniqueValidator<T> extends Validator<dynamic> {
  final UniqueValidatorFunctionTest<T> test;
  UniqueValidator(this.test);

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
      assert(!(control is FormArray));
      FormArray<dynamic> formArray = control as FormArray;

      if (formArray.controls.length < 2) {
        return null;
      }

      if (formArray.rawValue.toSet().toList().length != formArray.controls.length) {
        final error = { Vm.ValidationMessage.unique : true };
        formArray.markAllAsTouched();
        return error;
      }

      return null;
  }
}
