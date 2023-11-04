import 'package:flutter/material.dart';
import 'package:pjt_mobile_frontend/screen/home_screen.dart';

class FeedButton extends StatelessWidget {
  final List<Feed> feedList;
  const FeedButton({required this.feedList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: (feedList.length / 2).ceil(),
      itemBuilder: (context, index) {
        final item1 = feedList[index * 2];
        final item2 =
            (index * 2 + 1 < feedList.length) ? feedList[index * 2 + 1] : null;

        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                          child: Text(item1.place),
                        ),
                      )
                    ],
                  ),
                  Text(item1.title),
                  Text(item1.tag)
                ],
              ),
            ),
            SizedBox(width: 15),
            if (item2 != null)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                            child: Text(item2.place),
                          ),
                        )
                      ],
                    ),
                    Text(item2.title),
                    Text(item2.tag)
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
