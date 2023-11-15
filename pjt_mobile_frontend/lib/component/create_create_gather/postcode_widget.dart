import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/constant/color.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class PostcodeWidget extends StatefulWidget {
  final Function(String) onAddressChanged;
  const PostcodeWidget({super.key, required this.onAddressChanged});

  @override
  State<PostcodeWidget> createState() => _PostcodeWidgetState();
}

class _PostcodeWidgetState extends State<PostcodeWidget> {
  final TextEditingController addressDetailController = TextEditingController();
  String addressJSON = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  KopoModel model = await Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RemediKopo(),
                    ),
                  );
                  setState(() {
                    addressJSON = '${model.address}';
                  });
                  widget.onAddressChanged(addressJSON);
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
                    child: addressJSON.isEmpty
                        ? Text(
                            '주소를 입력하세요',
                            style: textTheme.subtitle2,
                          )
                        : Text(
                            '${addressJSON}',
                            style: textTheme.bodyText1,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 65,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  KopoModel model = await Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => RemediKopo(),
                    ),
                  );
                  setState(() {
                    addressJSON = '${model.address}';
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: BUTTON_COLOR, // 변경할 색상을 여기에 설정
                ),
                child: Text(
                  '검색',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
