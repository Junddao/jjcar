import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:jjcar/generated/locale_keys.g.dart';
import 'package:jjcar/model/model_question.dart';
import 'package:jjcar/style/colors.dart';
import 'package:jjcar/style/textstyles.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final PageController _pageController = PageController();

  List<int> results = [5, 5, 5, 5, 5, 5, 5];

  bool isSelectedFirstYes = false;
  bool isSelectedFirstNo = false;

  bool isSelectedSecondYes = false;
  bool isSelectedSecondNo = false;

  bool isSelectedThirdYes = false;
  bool isSelectedThirdNo = false;

  Timer? _timer;
  bool _isPlaying = false;

  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  void initState() {
    _startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      child: PageView(
        // physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          contentsPage(0, LocaleKeys.q0_c1.tr(), LocaleKeys.q0_c2.tr(),
              LocaleKeys.q0_c3.tr(), LocaleKeys.q0_c4.tr()),
          contentsPage(1, LocaleKeys.q1_c1.tr(), LocaleKeys.q1_c2.tr(),
              LocaleKeys.q1_c3.tr(), LocaleKeys.q1_c4.tr()),
          contentsPage(2, LocaleKeys.q2_c1.tr(), LocaleKeys.q2_c2.tr(),
              LocaleKeys.q2_c3.tr(), LocaleKeys.q2_c4.tr()),
          contentsPage(3, LocaleKeys.q3_c1.tr(), LocaleKeys.q3_c2.tr(),
              LocaleKeys.q3_c3.tr(), LocaleKeys.q3_c4.tr()),
          contentsPage(4, LocaleKeys.q4_c1.tr(), LocaleKeys.q4_c2.tr(),
              LocaleKeys.q4_c3.tr(), LocaleKeys.q4_c4.tr()),
          contentsPage(5, LocaleKeys.q5_c1.tr(), LocaleKeys.q5_c2.tr(),
              LocaleKeys.q5_c3.tr(), LocaleKeys.q5_c4.tr()),
          contentsPage(6, LocaleKeys.q6_c1.tr(), LocaleKeys.q6_c2.tr(),
              LocaleKeys.q6_c3.tr(), LocaleKeys.q6_c4.tr()),
          lastPage(),
        ],
      ),
    );
  }

  Widget contentsPage(int index, String s1, String s2, String s3, String s4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        index == 0
            ? Icon(Icons.arrow_back_ios, color: Colors.transparent)
            : Icon(Icons.arrow_back_ios),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: AnimatedContainer(
                      // Use the properties stored in the State class.
                      width: _width,
                      height: _height,
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: _borderRadius,
                      ),
                      // Define how long the animation should take.
                      duration: const Duration(seconds: 1),
                      // Provide an optional curve to make the animation feel smoother.
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(ModelQuestions.questions[index],
                        style: MTextStyles.bold18Black),
                  ),
                  flex: 8,
                ),
                AnimatedButton(
                  backgroundColor: MColors.white_three08,
                  selectedBackgroundColor: MColors.facebook_blue,
                  // height: 100,
                  // width: 300,
                  text: s1,
                  isReverse: true,
                  selectedTextColor: Colors.white,
                  transitionType: TransitionType.BOTTOM_TO_TOP,
                  textStyle: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  borderRadius: 12,
                  isSelected: results[index] == 0 ? true : false,
                  onPress: () async {
                    setState(() {
                      if (results[index] == 0) {
                        results[index] == 5;
                      } else {
                        results[index] = 0;
                      }
                    });
                    Future.delayed(Duration(milliseconds: 500), () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    });
                  },
                ),
                SizedBox(height: 8),
                AnimatedButton(
                  backgroundColor: MColors.white_three08,
                  selectedBackgroundColor: MColors.facebook_blue,
                  // height: 100,
                  // width: 300,
                  text: s2,
                  isReverse: true,
                  selectedTextColor: Colors.white,
                  transitionType: TransitionType.BOTTOM_TO_TOP,
                  textStyle: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  borderRadius: 12,
                  isSelected: results[index] == 1 ? true : false,
                  onPress: () async {
                    setState(() {
                      if (results[index] == 1) {
                        results[index] == 5;
                      } else {
                        results[index] = 1;
                      }
                    });
                    Future.delayed(Duration(milliseconds: 500), () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    });
                  },
                ),
                SizedBox(height: 8),
                AnimatedButton(
                  backgroundColor: MColors.white_three08,
                  selectedBackgroundColor: MColors.facebook_blue,
                  // height: 100,
                  // width: 300,
                  text: s3,
                  isReverse: true,
                  selectedTextColor: Colors.white,
                  transitionType: TransitionType.BOTTOM_TO_TOP,
                  textStyle: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  borderRadius: 12,
                  isSelected: results[index] == 2 ? true : false,
                  onPress: () async {
                    setState(() {
                      if (results[index] == 2) {
                        results[index] == 5;
                      } else {
                        results[index] = 2;
                      }
                    });
                    Future.delayed(Duration(milliseconds: 500), () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    });
                  },
                ),
                SizedBox(height: 8),
                AnimatedButton(
                  backgroundColor: MColors.white_three08,
                  selectedBackgroundColor: MColors.facebook_blue,
                  // height: 100,
                  // width: 300,
                  text: s4,
                  isReverse: true,
                  selectedTextColor: Colors.white,
                  transitionType: TransitionType.BOTTOM_TO_TOP,
                  textStyle: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  borderRadius: 12,
                  isSelected: results[index] == 3 ? true : false,

                  onPress: () async {
                    setState(() {
                      if (results[index] == 3) {
                        results[index] == 5;
                      } else {
                        results[index] = 3;
                      }
                    });
                    Future.delayed(Duration(milliseconds: 500), () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }

  Widget lastPage() {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedContainer(
                // Use the properties stored in the State class.
                width: _width * 2,
                height: _height * 2,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                // Define how long the animation should take.
                duration: const Duration(seconds: 1),
                // Provide an optional curve to make the animation feel smoother.
                curve: Curves.fastOutSlowIn,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              for (var element in results) {
                if (element == 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(LocaleKeys.warning_message.tr())));
                  return;
                }
              }

              Navigator.of(context).pushNamed('PageResult', arguments: results);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: MColors.facebook_blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text(LocaleKeys.confirm.tr(),
                      style: MTextStyles.bold16White)),
            ),
          ),
        ],
      ),
    );
  }

  void _startTimer() {
    _isPlaying = !_isPlaying;

    if (_isPlaying) {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          // Create a random number generator.
          final random = Random();

          // Generate a random width and height.
          _width = random.nextInt(50).toDouble();
          _height = random.nextInt(50).toDouble();

          // Generate a random color.
          _color = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          );

          // Generate a random border radius.
          _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
        });
      });
    }
  }
}
