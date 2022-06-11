import 'package:flutter/material.dart';

AppBar defaultAppBar = AppBar(
  title: const Text("BMI CALCULATOR"),
  elevation: 0,
);

const Color primaryColor = Color(0xff0a0e21);
const Color customBlue = Color(0XFF517df6);

const TextStyle labelTextStyle = TextStyle(
  fontSize: 18,
  color: primaryColor, // Color(0xff8d8e98),
);

const TextStyle boldLabelTextStyle = TextStyle(
  fontSize: 20,
  color: primaryColor, // Color(0xff8d8e98),
  fontWeight: FontWeight.bold,
);
const TextStyle numberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const String underweightSevere = "Underweight (Severe thinness)";
const String underweightModerate = "Underweight (Moderate thinness)";
const String underweightMild = "Underweight (Mild thinness)";
const String normal = "Normal";
const String overweight = "Overweight";
const String obeseI = "Obese (Class I)";
const String obeseII = "Obese (Class II)";
const String obeseIII = "Obese (Class III)";
