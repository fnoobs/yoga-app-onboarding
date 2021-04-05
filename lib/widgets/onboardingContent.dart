import 'package:flutter/material.dart';
import 'package:onboarding_screens/contants.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            color: kPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: kDarkText,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(flex: 1),
        Image.asset(
          imageUrl,
          height: 300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: kSecondaryText,
              fontSize: 14,
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
