import 'package:flutter/material.dart';
import 'package:gamble/core/app_export.dart';
import 'package:gamble/widgets/app_bar/custom_app_bar.dart';

class OnboardingPage {
  final String description;
  final String backgroundImage;
  final String imagePath;
  Widget? additionalWidget = Container();
  PreferredSizeWidget? appBar = CustomAppBar();

  OnboardingPage(
      {this.additionalWidget,
      this.appBar,
      required this.backgroundImage,
      required this.description,
      required this.imagePath});
}


