import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_app/view/content_screen.dart';
import '../view/constant.dart' as color;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 203, 248, 223),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Positioned(
              bottom: 0,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pick Your Favourite\nContests",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "We make great design work\n"
                    "happen with our great community designer",
                    style: TextStyle(color: Colors.grey[300], fontSize: 18),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: color.AppColor.backgColor,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: color.AppColor.backgColor,
                            elevation: 0),
                        onPressed: () {
                          Get.to(ContentScreen());
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
