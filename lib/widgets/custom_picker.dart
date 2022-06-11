import 'package:bmi/constants/constant.dart';
import 'package:bmi/widgets/bmi_card.dart';
import 'package:flutter/cupertino.dart';

class CustomPicker extends StatefulWidget {
  const CustomPicker({
    Key? key,
    required this.title,
    required this.unitLabel,
    required this.start,
    required this.end,
    required this.onSelectedItemChanged,
  }) : super(key: key);

  final String title, unitLabel;
  final int start, end;
  final Function onSelectedItemChanged;

  @override
  State<CustomPicker> createState() => _CustomPickerState();
}

class _CustomPickerState extends State<CustomPicker> {
  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end + 1; i++) {
      weights.add(
        Text(
          "$i ${widget.unitLabel}",
          style: labelTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }

    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title, style: boldLabelTextStyle),
        BmiCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: 30,
                  ),
                  itemExtent: 25,
                  magnification: 2,
                  useMagnifier: true,
                  onSelectedItemChanged: (val) {
                    widget.onSelectedItemChanged(val);
                  },
                  children: generateList(widget.start, widget.end),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
