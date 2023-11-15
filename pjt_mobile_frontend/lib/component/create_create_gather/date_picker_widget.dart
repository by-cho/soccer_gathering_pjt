import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  const DatePickerWidget({super.key, required this.onDateChanged});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  bool _dateSelect = false;

  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  void onDatePressed() {
    //dialog
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  Expanded(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: selectedDate,
                      minimumDate: DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                      ),
                      onDateTimeChanged: (DateTime date) {
                        setState(() {
                          selectedDate = date;
                        });
                        ;
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
                            _dateSelect = true;
                          });
                          widget.onDateChanged(
                              selectedDate); // gatheringWay 값을 부모에게 전달
                          Navigator.pop(context);
                        },
                        child: Text('입력'),
                      ),
                    ),
                  ),
                ],
              ),
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
      onTap: onDatePressed,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: _dateSelect == false
              ? Text(
                  '날짜 선택',
                  style: textTheme.subtitle2,
                )
              : Text(
                  '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
                  style: textTheme.bodyText1,
                ),
        ),
      ),
    );
  }
}
