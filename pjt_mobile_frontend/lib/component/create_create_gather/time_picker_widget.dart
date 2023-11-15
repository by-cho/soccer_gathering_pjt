import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';

class TimePickerWidget extends StatefulWidget {
  final Function(DateTime) onTimeChanged;

  const TimePickerWidget({super.key, required this.onTimeChanged});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  bool _timeSelect = false;

  DateTime selectedTime = DateTime(
    DateTime.now().hour,
    DateTime.now().minute,
  );

  void onTimePressed() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return Container(
          height: 250.0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: selectedTime,
                    onDateTimeChanged: (DateTime newDateTime) {
                      // Handle the selected time
                      setState(() {
                        selectedTime = newDateTime;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: BUTTON_COLOR, // 버튼 배경색 변경
                        onPrimary: Colors.white, // 텍스트 색 변경
                      ),
                      onPressed: () {
                        setState(() {
                          _timeSelect = true;
                        });
                        widget.onTimeChanged(
                            selectedTime); // gatheringWay 값을 부모에게 전달
                        Navigator.pop(context);
                      },
                      child: Text('입력'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: onTimePressed,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: _timeSelect == false
              ? Text(
                  '시간 선택',
                  style: textTheme.subtitle2,
                )
              : Text(
                  selectedTime.minute.toInt() < 10
                      ? selectedTime.hour.toInt() < 10
                          ? '0${selectedTime.hour} : 0${selectedTime.minute}'
                          : '${selectedTime.hour} : 0${selectedTime.minute}'
                      : '${selectedTime.hour} : ${selectedTime.minute}',
                  style: textTheme.bodyText1,
                ),
        ),
      ),
    );
  }
}
