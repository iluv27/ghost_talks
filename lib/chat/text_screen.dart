// ignore_for_file: sized_box_for_whitespace, must_be_immutable
import 'package:flutter/material.dart';
import 'package:ghost_talks/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TextBlob extends StatelessWidget {
  TextBlob({super.key});

  // ignore: unused_field
  final _firestore = FirebaseFirestore.instance;
  TextEditingController message = TextEditingController();

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
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xff222222)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 20,
                        child: Container(
                          height: 70,
                          child: TextField(
                            controller: message,
                            onChanged: ((value) {
                              value = message.text;
                            }),
                            decoration: InputDecoration(
                              prefixIcon: Material(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 12),
                                  child: Ink(
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(60, 60)),
                                      ),
                                      color: Color(0XFF455A64),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.mic),
                                      iconSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ), // Leading icon
                              suffixIcon: Material(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10),
                                  child: Ink(
                                    padding: const EdgeInsets.all(3.5),
                                    decoration: const ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(60, 60)),
                                      ),
                                      color: Color.fromARGB(57, 69, 90, 100),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        print(message.text);
                                      },
                                      icon: const Icon(Icons.send),
                                      iconSize: 20,
                                      color: const Color(0XFF455A64),
                                    ),
                                  ),
                                ),
                              ), // Trailing icon
                              hintText: 'Message...', // Placeholder text
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(60, 60)),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 2,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(60, 60)),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(60, 60)),
                                borderSide: BorderSide(
                                  color: Color(0xff263238),
                                  width: 2,
                                ),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(51, 69, 90, 100),
                            ), // Border
                          ),
                        ),
                      ),
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
//                           )