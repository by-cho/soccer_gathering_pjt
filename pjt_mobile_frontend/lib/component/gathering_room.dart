import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/view/gather_detail.dart';

import '../model/room_model.dart';

class GatheringRoom extends StatelessWidget {
  final List<Room> roomList;

  const GatheringRoom({
    required this.roomList,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: roomList
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: EdgeInsets.only(bottom: e.key == 2 ? 15 : 10.0),
              child: GestureDetector(
                onTap: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GatherDetail(data: e.value),
                    ),
                  );
                },
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 95,
                          height: 95,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 4, 12, 4),
                                child: Text(
                                  e.value.tag,
                                  style: textTheme.bodyText2,
                                ),
                              ),
                            ),
                            Text(
                              e.value.title,
                              style: textTheme.bodyText1,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.place,
                                  size: 18,
                                ),
                                Text(
                                  e.value.place,
                                  style: textTheme.bodyText1,
                                ),
                                Text(
                                  " ・ ",
                                  style: textTheme.bodyText1,
                                ),
                                Text(
                                  e.value.date,
                                  style: textTheme.bodyText1,
                                ),
                                Text(
                                  " ・ ",
                                  style: textTheme.bodyText1,
                                ),
                                Text(
                                  e.value.time,
                                  style: textTheme.bodyText1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  size: 18,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  e.value.peopleNum,
                                  style: textTheme.bodyText1,
                                ),
                                Text(
                                  '/',
                                  style: textTheme.bodyText1,
                                ),
                                Text(
                                  e.value.maxNum,
                                  style: textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
