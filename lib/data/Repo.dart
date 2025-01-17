import 'dart:math';

import 'package:device_apps/device_apps.dart';

import '../cube.dart';
import 'AppInfo.dart';

class Repo {
  static Map<FaceColor, List<AppInfo>> map = {
    FaceColor.YELLOW: List.filled(9, null, growable: false),
    FaceColor.GREEN: List.filled(9, null, growable: false),
    FaceColor.WHITE: List.filled(9, null, growable: false),
    FaceColor.BLUE: List.filled(9, null, growable: false),
    FaceColor.RED: List.filled(9, null, growable: false),
    FaceColor.ORANGE: List.filled(9, null, growable: false),
  };

  static Future<void> init() async {
    print('app start');
    var apps = await getApps();

    print('apps end = ${apps.length}');
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 9; j++) {
        var app = apps[i*9+j];
        print('put $i and $j');
        map[FaceColor.values[i]][j] = app;
      }
      // ~/ 为整除
    }
  }

  static Future<List<AppInfo>> getApps() async {
    var value = await DeviceApps.getInstalledApplications(
        includeSystemApps: true,
        includeAppIcons: true,
        onlyAppsWithLaunchIntent: true);
    var res =value.map((e) {
      var k = e as ApplicationWithIcon;
      return AppInfo(k,k.appName, k.icon, k.packageName,);

    }).toList(growable: false);

    return Future.value(res);
  }
}
