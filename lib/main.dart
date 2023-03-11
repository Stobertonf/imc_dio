import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:imc_dio/app/ui/ios/cupertino_app.dart';
import 'package:imc_dio/app/ui/android/material.app.dart';

void main() =>
    //Platform.isAndroid ? runApp(MyMaterialApp()) : runApp(MyCupertinoApp());
    runApp(MyMaterialApp());
