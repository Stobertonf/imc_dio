import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:imc_dio/ui/ios/cupertino_app.dart';
import 'package:imc_dio/ui/android/material.app.dart';

void main() =>
    Platform.isIOS ? runApp(MyCupertinoApp()) : runApp(MyMaterialApp());
