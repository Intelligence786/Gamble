import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamble/core/app_export.dart';

import '../game_bloc/game_bloc.dart';
import 'custom_bottom_button.dart';
import 'information_panel.dart';

class SettingsMenu extends StatefulWidget {
  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  bool sound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        //padding: EdgeInsets.only(top: 100.h),
        height: 150.h,
        width: 150.h,
        child: CustomBottomButton(
          buttonType: ButtonType.close,
          onTap: () => context.read<GameBloc>().add(
                OpenMainMenu(),
              ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: AppDecoration.fillBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: InformationPanel(
                headerText: 'Settings',
                insideContent: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Music',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Container(
                              height: 50,
                              child: CupertinoSwitch(
                                  value: sound,
                                  onChanged: (value) {
                                    setState(() {
                                      sound = !sound;
                                    });
                                  }))
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Privacy Policy',
                                style: CustomTextStyles.titleMediumWhiteA700_1,
                              ),
                            ),
                            height: 40.v,
                          ),
                          Container(
                            height: 40.v,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Term of Use',
                                style: CustomTextStyles.titleMediumWhiteA700_1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
