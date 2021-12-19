import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_reactive_forms_validators/validation_message/validation_message.dart' as Vm;

/// Validator that requires the control's value to be even.
class EvenValidator extends Validator<dynamic> {
  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    assert(control is FormArray || control is FormGroup);
    
    if (control.value == null) {
      return null;
    }

    if (control.value is String) control.value = num.tryParse(control.value);

    if ((control.value as num).floor().isEven) {
      control.setErrors({Vm.ValidationMessage.even: true});
      control.markAsTouched();
    } else {
      control.removeError(Vm.ValidationMessage.even);
    }
  }
}
