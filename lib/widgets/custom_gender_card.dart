import 'package:bmi/constants/constant.dart';
import 'package:bmi/widgets/bmi_card.dart';
import 'package:bmi/widgets/gender_icon_text.dart';
import 'package:flutter/material.dart';

class CustomGenderCard extends StatelessWidget {
  const CustomGenderCard({
    Key? key,
    required this.onTap,
    required this.isChosen,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  final Function() onTap;
  final bool isChosen;
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BmiCard(
        borderColor: isChosen ? customBlue : Colors.white,
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: GenderIconText(
                  title: title,
                  icon: iconData,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Icon(
                Icons.check_circle,
                color: isChosen ? customBlue : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
