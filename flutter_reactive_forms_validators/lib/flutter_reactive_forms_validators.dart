library flutter_reactive_forms_validators;

import 'package:flutter_reactive_forms_validators/form_array_validators/every_validator.dart';
import 'package:flutter_reactive_forms_validators/form_array_validators/unique_validator.dart';
import 'package:flutter_reactive_forms_validators/form_control_validators/even_validator.dart';
import 'package:flutter_reactive_forms_validators/form_control_validators/odd_validator.dart';
import 'package:flutter_reactive_forms_validators/form_control_validators/password_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Author: Gabriel Audette
// Original Author : Joan Pablo Jimenez Milian. All rights reserved.
// Use of this source code is governed by the MIT license that can be
// found in the LICENSE file.

class FlutterReactiveFormValidators {
  FlutterReactiveFormValidators._();

    // FormControl validator functions

  static ValidatorFunction get even => EvenValidator().validate;
  static ValidatorFunction get odd => OddValidator().validate;
  static ValidatorFunction get password => PasswordValidator().validate;

  // FormArray validator functions

  static ValidatorFunction every<T>(EveryValidatorFunctionTest<T> test) =>
      EveryValidator<T>(test).validate;

  static ValidatorFunction unique<T>(UniqueValidatorFunctionTest<T> test) =>
    UniqueValidator<T>(test).validate;
}
