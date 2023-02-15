import 'package:flutter/material.dart';
import 'package:ghost_talks/constants.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFFDFE8E7), width: 0.8),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: ListTile(
              horizontalTitleGap: 0,
              contentPadding: const EdgeInsets.all(0),
              leading: CircleAvatar(
                maxRadius: 45,
                backgroundColor: Colors.blueGrey,
                child: Text(
                  'PO',
                  style: kTextStyle(),
                ),
              ),
              title: Row(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Peter Obi',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              subtitle: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Hello dear! Whatssup??',
                  style: TextStyle(color: Colors.black38),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(top: 5, right: 12.0),
                child: Column(
                  children: const [
                    Text(
                      '22:00',
                      style: TextStyle(color: Colors.black38),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Icon(Icons.done)
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
