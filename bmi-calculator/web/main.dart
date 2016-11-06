// Copyright (c) 2016, Luke Muller. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

bool imperial = true;
const int IMPERIAL_MULTIPLIER = 703;

void main() {
  querySelector("#unit_type1").onChange.listen(changeUnits);
  querySelector("#unit_type2").onChange.listen(changeUnits);
  querySelector("#submit").onClick.listen(calculate);
}

void changeUnits(Event e) {
  if ((querySelector("#unit_type1") as RadioButtonInputElement).checked) {
    imperial = true;
    querySelector("#weight_units").text = "pounds";
    querySelector("#height_units").text = "inches";
  } else {
    imperial = false;
    querySelector("#weight_units").text = "kilograms";
    querySelector("#height_units").text = "meters";
  }
}

void calculate(MouseEvent event) {
  double height, weight;
  try {
    weight = double.parse((querySelector("#weight_input") as InputElement).value);
    height = double.parse((querySelector("#height_input") as InputElement).value);
  } on FormatException {
    window.alert("Only numbers are valid input.");
    return ;
  }

  double bmi = weight / (height * height);
  if (imperial) {
    bmi = bmi * IMPERIAL_MULTIPLIER;
  }
  String comment;
  querySelector("#result1").text = "Your BMI is " + bmi.toStringAsFixed(1);
  if (bmi < 18.5 ) {
    comment = "Underweight";
  } else if (bmi >= 18.5 && bmi < 25.0) {
    comment = "Normal";
  } else if (bmi >= 25.0 && bmi < 30.0) {
    comment = "Overweight";
  } else {
    comment = "Obese";
  }
  querySelector("#result2").text = comment;

}
