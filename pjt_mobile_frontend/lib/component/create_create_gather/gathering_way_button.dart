import 'package:flutter/material.dart';

class GatheringWayButton extends StatefulWidget {
  final Function(String)
      onGatheringWayChanged; // 부모에게 gatheringWay 값을 전달할 콜백 함수

  const GatheringWayButton({Key? key, required this.onGatheringWayChanged})
      : super(key: key);

  @override
  State<GatheringWayButton> createState() => _GatheringWayButtonState();
}

class _GatheringWayButtonState extends State<GatheringWayButton> {
  String gatheringWay = ''; // GatheringWayButton의 내부 상태로 사용될 gatheringWay

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    gatheringWay = '승인제';
                  });
                  widget.onGatheringWayChanged(
                      gatheringWay); // gatheringWay 값을 부모에게 전달
                },
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: gatheringWay == '승인제'
                        ? Colors.white
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0, // 보더의 두께
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    '승인제',
                    style: gatheringWay == '승인제'
                        ? TextStyle(color: Colors.black)
                        : TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    gatheringWay = '선착순';
                  });
                  widget.onGatheringWayChanged(
                      gatheringWay); // gatheringWay 값을 부모에게 전달
                },
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: gatheringWay == '선착순'
                        ? Colors.white
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0, // 보더의 두께
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('선착순',
                        style: gatheringWay == '선착순'
                            ? TextStyle(color: Colors.black)
                            : TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
