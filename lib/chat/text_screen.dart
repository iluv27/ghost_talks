import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ghost_talks/constants.dart';

class TextBlob extends StatelessWidget {
  const TextBlob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decorationProperty(4),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 20),
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
                      title: const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Mr Peter',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      subtitle: Row(
                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 5,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Online',
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                      trailing: Material(
                        color: Colors.transparent,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0XFF455A64),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.door_back_door_outlined),
                            iconSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 30, right: 20),
                    child: Stack(fit: StackFit.loose, children: [
                      Column(
                        children: [
                          Container(
                            height: null,
                            width: 250,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 201, 247, 244),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                            ),
                            child: const Expanded(
                              child: Text(
                                'Where are you? I have been looking for you for several days',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 50,
                          color: Colors.grey[200],
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search), // Leading icon
                              suffixIcon: Icon(Icons.clear), // Trailing icon
                              hintText: 'Search', // Placeholder text
                              border: OutlineInputBorder(), // Border
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Align(
//                         alignment: Alignment.topLeft,
//                         widthFactor: 100,
//                         child:
//                           ),