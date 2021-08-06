import 'dart:typed_data';

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

import '../cube.dart';


class AppInfo {
  Application rawApp;
  String name;
  Uint8List icon;
  String packageName;

  AppInfo(this.rawApp,this.name, this.icon, this.packageName);
}
