import 'package:bmi/constants/constant.dart';
import 'package:bmi/enums/enum.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/models/human_model.dart';
import 'package:bmi/views/result_screen.dart';
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
  HumanModel? human;
  @override
  void initState() {
    super.initState();
    human = HumanModel(height: 100, weight: 100, age: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar,
      bottomNavigationBar: CustomBottomNavigator(
        title: dataScreenButton,
        onTap: () {
          final bmiCalculator = BmiCalculator(humanModel: human!);
          bmiCalculator.calculateBMI();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ResultScreen(
                  bmi: bmiCalculator.bmiModel!.bmi!,
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
                      human?.gender = Gender.male;
                      setState(() {});
                    },
                    isChosen: human?.gender == Gender.male,
                    title: genderMale,
                    iconData: Icons.male,
                  ),
                ),
                Expanded(
                  child: CustomGenderCard(
                    onTap: () {
                      human?.gender = Gender.female;
                      setState(() {});
                    },
                    isChosen: human?.gender == Gender.female,
                    title: genderFemale,
                    iconData: Icons.female,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            //HEIGHT
            Column(
              children: [
                const Text(labelHeight, style: boldLabelTextStyle),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: BmiCard(
                        child: Slider(
                          min: 80,
                          max: 200,
                          value: human!.height!.toDouble(),
                          thumbColor: primaryColor,
                          activeColor: primaryColor,
                          onChanged: (value) {
                            human?.height = value.toInt();
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
                                human!.height.toString(),
                                style: labelTextStyle,
                              ),
                              const Text(
                                " $labelHeightUnit",
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
                    title: labelWeight,
                    unitLabel: labelWeightUnit,
                    start: 20,
                    end: 220,
                    onSelectedItemChanged: (value) {
                      human?.weight = value + 20;
                      setState(() {});
                    },
                  ),
                ),
                //AGE
                Expanded(
                  child: CustomPicker(
                    title: labelAge,
                    unitLabel: labelAgeUnit,
                    start: 15,
                    end: 90,
                    onSelectedItemChanged: (value) {
                      human?.weight = value + 20;
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
