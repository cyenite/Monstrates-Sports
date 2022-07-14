import 'package:flutter/material.dart';
import 'package:mostrates_sports/models/category.dart';

class SportDetail extends StatelessWidget {
  Category category;
  SportDetail({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8, bottom: 8.0),
                child: Image.asset(
                  "assets/thumb_front.png",
                  scale: 10,
                )),
            SizedBox(
              width: 10,
            ),
            Text(
              category.name.toString(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        ),
        Divider(
          color: Colors.white.withOpacity(0.5),
        )
      ],
    );
  }
}
