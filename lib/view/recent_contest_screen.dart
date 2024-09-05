import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/constant.dart' as color;

class RecentContestScreen extends StatefulWidget {
  const RecentContestScreen({super.key});

  @override
  State<RecentContestScreen> createState() => _RecentContestScreenState();
}

class _RecentContestScreenState extends State<RecentContestScreen> {
  List info = [];

  _readData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/detail.json")
        .then((s) {
      setState(() {
        info = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.AppColor.secondColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios,
                color: Colors.black.withOpacity(.5))),
      ),
      backgroundColor: Color.fromARGB(255, 203, 248, 223),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 10, top: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0; i < info.length; i++)
                      Container(
                        height: 220,
                        margin: EdgeInsets.only(
                          bottom: 30,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/detail', arguments: {
                              'title': info[i]['title'].toString(),
                              'text': info[i]['text'].toString(),
                              'name': info[i]['name'].toString(),
                              'image': info[i]['image'].toString(),
                              'time': info[i]['time'].toString(),
                              'prize': info[i]['prize'].toString(),
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            height: 220,
                            width: MediaQuery.of(context).size.width - 20,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: i.isEven
                                    ? color.AppColor.backgScaffoldColor
                                    : color.AppColor.secondColor),
                            child: Column(
                              children: [
                                Container(
                                    child: Row(
                                  children: [
                                    Text(
                                      info[i]['title'],
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                    Expanded(child: Container())
                                  ],
                                )),
                                SizedBox(height: 10),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    info[i]['text'],
                                    style: TextStyle(
                                        fontSize: 15, color: Color(0xFFb8eefc)),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                                Row(children: [
                                  for (int i = 0; i < 4; i++)
                                    Container(
                                      width: 50,
                                      height: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    info[i]['image']),
                                                fit: BoxFit.cover)),
                                      ),
                                    )
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
