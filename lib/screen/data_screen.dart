import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/screen/result_screen.dart';
import 'package:bmi/widgets/bmi_card.dart';
import 'package:bmi/widgets/custom_bottom_navigator.dart';
import 'package:bmi/widgets/custom_gender_card.dart';
import 'package:bmi/widgets/custom_picker.dart';
import 'package:flutter/material.dart';

class Datascreen extends StatefulWidget {
  const Datascreen({Key? key}) : super(key: key);

  @override
  State<Datascreen> createState() => _DatascreenState();
}

class _DatascreenState extends State<Datascreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      bottomNavigationBar: CustomBottomNavigator(
        title: "Calculate",
        onTap: () {
          final bmiCalculator = BmiCalculator(height: height, weight: weight);
          bmiCalculator.calculateBMI();
          print(
              "You are a $gender. Height: $height. Weight: $weight. Age: $age. Your BMI is ${bmiCalculator.bmi}");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              },
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            //GENDER
            Row(
              children: [
                Expanded(
                  child: CustomGenderCard(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    isChosen: gender == "male",
                    title: "Male",
                    iconData: Icons.male,
                  ),
                ),
                Expanded(
                  child: CustomGenderCard(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    isChosen: gender == "female",
                    title: "Female",
                    iconData: Icons.female,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            //HEIGHT
            Column(
              children: [
                const Text("HEIGHT", style: boldLabelTextStyle),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: BmiCard(
                        child: Slider(
                          min: 80,
                          max: 200,
                          value: height.toDouble(),
                          thumbColor: primaryColor,
                          activeColor: primaryColor,
                          onChanged: (value) {
                            height = value.toInt();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: BmiCard(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "$height",
                                style: labelTextStyle,
                              ),
                              const Text(
                                " cm",
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 30),
            //WEIGHT & AGE
            Row(
              children: [
                //WEIGHT
                Expanded(
                  child: CustomPicker(
                    title: "WEIGHT",
                    unitLabel: "kg",
                    start: 20,
                    end: 220,
                    onSelectedItemChanged: (value) {
                      weight = value + 20;
                      setState(() {});
                    },
                  ),
                ),
                //AGE
                Expanded(
                  child: CustomPicker(
                    title: "AGE",
                    unitLabel: "y.o.",
                    start: 15,
                    end: 90,
                    onSelectedItemChanged: (value) {
                      weight = value + 20;
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
