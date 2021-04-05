import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding_screens/contants.dart';
import 'package:onboarding_screens/widgets/onboardingContent.dart';

class OnBaordingScreen extends StatefulWidget {
  const OnBaordingScreen({Key? key}) : super(key: key);

  @override
  _OnBaordingScreenState createState() => _OnBaordingScreenState();
}

class _OnBaordingScreenState extends State<OnBaordingScreen> {
  List<Map<String, String>> data = [
    {
      "imageUrl": "assets/images/img_1.jpg",
      "title": "WELCOME TO YOGA",
      "subtitle": "A completed guideline",
      "description":
          "Improves posture. Working for long hours on a desk could not only hurt your spine but also make you feel tired at the end of the day",
    },
    {
      "imageUrl": "assets/images/img_2.jpg",
      "title": "22+ YOGA AASANAS",
      "subtitle": "Learn 22+ Yoga techniques",
      "description":
          "Meditation is a practice where an individual uses a technique - such as Vajrasana.",
    },
    {
      "imageUrl": "assets/images/img_3.png",
      "title": "HEALTH BENIFITS",
      "subtitle": "Health is wealth",
      "description":
          "Maintaining a regular yoga practice can provide physical and mental health benifits.",
    },
  ];

  int currentScreenIndex = 0;
  final PageController _pageController = PageController();

  void goToNext() {
    int nextPage =
        currentScreenIndex + 1 > data.length - 1 ? 0 : currentScreenIndex + 1;
    if (nextPage == 0) return;
    _pageController.animateToPage(
      nextPage,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'SKIP',
                      style: TextStyle(color: kPrimary),
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: data.length,
                  controller: _pageController,
                  onPageChanged: (idx) {
                    setState(() {
                      currentScreenIndex = idx;
                    });
                  },
                  itemBuilder: (ctx, idx) {
                    return OnBoardingContent(
                      title: data[idx]['title']!,
                      subtitle: data[idx]['subtitle']!,
                      description: data[idx]['description']!,
                      imageUrl: data[idx]['imageUrl']!,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(flex: 2),
                      ...List.generate(
                        3,
                        (index) => buildDot(idx: index),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: goToNext,
                        child: SvgPicture.asset(
                          'assets/images/arrow.svg',
                          width: 54,
                          height: 54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int idx = 0}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: idx == currentScreenIndex ? 30 : 8,
      height: 8,
      margin: const EdgeInsets.only(right: 3),
      decoration: BoxDecoration(
        color: idx == currentScreenIndex ? kPrimary : kPrimaryVariant,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
