import 'dart:math';

import 'package:flutter/material.dart';

import '../global/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController animation1Controller;
  late AnimationController animation2Controller;
  late Animation border1Animation;
  late Animation color1Animation;
  late Animation colorIcon1Animation;
  late Animation border2Animation;
  late Animation color2Animation;
  late Animation colorIcon2Animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation1Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation2Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    border1Animation =
        Tween<double>(begin: 5, end: 30).animate(animation1Controller);
    color1Animation =
        ColorTween(begin: Colors.grey[900], end: const Color(0xff383c4d))
            .animate(animation1Controller);
    colorIcon1Animation =
        ColorTween(begin: Colors.white, end: const Color(0xffeb1555))
            .animate(animation1Controller);
    border2Animation =
        Tween<double>(begin: 5, end: 30).animate(animation2Controller);
    color2Animation =
        ColorTween(begin: Colors.grey[900], end: const Color(0xff383c4d))
            .animate(animation2Controller);
    colorIcon2Animation =
        ColorTween(begin: Colors.white, end: const Color(0xffeb1555))
            .animate(animation2Controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Bmi Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    animation1Controller.forward();
                    Global.isMale = false;
                  });
                },
                child: Container(
                  height: 200,
                  width: 170,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color1Animation.value,
                    borderRadius: BorderRadius.circular(border1Animation.value),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female_outlined,
                        size: 100,
                        color: colorIcon1Animation.value,
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    animation2Controller.forward();
                    Global.isMale = false;
                  });
                },
                child: Container(
                  height: 200,
                  width: 170,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color2Animation.value,
                    borderRadius: BorderRadius.circular(border2Animation.value),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male_outlined,
                        size: 100,
                        color: colorIcon2Animation.value,
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "${Global.height}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              letterSpacing: 2)),
                      const TextSpan(
                        text: " cm",
                        style: TextStyle(
                          color: Color(0xff626473),
                        ),
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 1,
                  ),
                  child: Slider(
                    value: Global.height.toDouble(),
                    min: 80,
                    max: 228,
                    divisions: 148,
                    onChanged: (val) {
                      setState(() {
                        Global.height = val.toInt();
                      });
                    },
                    activeColor: const Color(0xfff5c1d1),
                    inactiveColor: const Color(0xff555555),
                    thumbColor: const Color(0xffeb1555),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 200,
                width: 170,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Weight",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "${Global.weight}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          backgroundColor: const Color(0xff4c4f5e),
                          onPressed: () {
                            setState(() {
                              Global.weight--;
                            });
                          },
                          child: const Icon(
                            Icons.minimize_outlined,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xff6e6f7a),
                          onPressed: () {
                            setState(() {
                              Global.weight++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color(0xfff67fa4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: 170,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Age",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "${Global.age}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                          backgroundColor: const Color(0xff4c4f5e),
                          onPressed: () {
                            setState(() {
                              Global.age--;
                            });
                          },
                          child: const Icon(
                            Icons.minimize_outlined,
                            color: Colors.white,
                          ),
                        ),
                        FloatingActionButton(
                          backgroundColor: const Color(0xff6e6f7a),
                          onPressed: () {
                            setState(() {
                              Global.age++;
                            });
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color(0xfff67fa4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffeb1555),
                padding:
                    EdgeInsets.only(left: 150, right: 150, top: 10, bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              setState(() {
                Global.result = Global.weight ~/ pow(Global.height / 100, 2);
              });

              Navigator.of(context).pushNamed('result_page');
            },
            child: const Text(
              "Convert",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
