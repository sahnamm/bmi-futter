import 'dart:math';

import 'package:bmi/constants/constant.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/models/human_model.dart';

class BmiCalculator {
  HumanModel? humanModel;
  BmiModel? bmiModel;

  BmiCalculator({
    required this.humanModel,
  });

  BmiCalculator.fromBmiValue(value) {
    bmiModel = BmiModel.setAll(bmi: value);
  }

  calculateBMI() {
    double heightInMeter = humanModel!.height! / 100;
    final h = pow(heightInMeter, 2);
    var bmi = humanModel!.weight! / h;
    bmiModel = BmiModel.setAll(bmi: bmi);
  }

  determineBmiCategory() {
    String category = "";
    if (bmiModel!.bmi! < 16.0) {
      category = underweightSevere;
    } else if (bmiModel!.bmi! < 17) {
      category = underweightModerate;
    } else if (bmiModel!.bmi! < 18.5) {
      category = underweightMild;
    } else if (bmiModel!.bmi! < 25) {
      category = normal;
    } else if (bmiModel!.bmi! < 30) {
      category = overweight;
    } else if (bmiModel!.bmi! < 35) {
      category = obeseI;
    } else if (bmiModel!.bmi! < 40) {
      category = obeseII;
    } else if (bmiModel!.bmi! >= 40) {
      category = obeseIII;
    }
    bmiModel!.bmiCategory = category;
  }

  getHealthRiskDescription() {
    String desc = "";
    switch (bmiModel!.bmiCategory!) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutrional deficiency and osteoporosis";
        break;
      case normal:
        desc = "Low risk (healthy range)";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome.";
        break;
      default:
    }
    bmiModel!.bmiDescription = desc;
  }
}
