import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomAppbarWidget extends AppBar{
CustomAppbarWidget({
    super.key,
    required Color backgroundColor,
    required String imageLogo,
    required String title,
    required Color titleColor,
  }) : super(
          elevation: 0,
          leadingWidth: 8,
          titleSpacing: 4,
          backgroundColor: backgroundColor,
          leading: const SizedBox.shrink(),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 0, left: 5, right: 30, bottom: 0),
              ),
              SizedBox(
                width: 64,
                height: 32,
                child: Image.asset(imageLogo, fit: BoxFit.contain),
              ),
              const SizedBox(width: 44),
              AutoSizeText(
                title,
                presetFontSizes: const [42, 36, 28, 20],
                minFontSize: 20,
                maxFontSize: 42,
                style: TextStyle(
                  fontFamily: 'Dosis',
                  color: titleColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
}