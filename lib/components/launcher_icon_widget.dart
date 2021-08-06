import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hacube/cube.dart';
import 'package:hacube/data/Repo.dart';

class LauncherIconWidget extends StatelessWidget {
  final FaceColor faceColor;
  final int positionInAFace;

  const LauncherIconWidget({Key key, this.faceColor, this.positionInAFace})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (faceColor == FaceColor.BLACK) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: colorMap[faceColor],
            border: Border.all(color: Colors.black)),
        padding: EdgeInsets.all(10),
      );
    }

    var app = Repo.map[faceColor][positionInAFace];

    var appIcon = app == null
        ? Container()
        : ClipOval(
          child: Image.memory(
              app.icon,
              color: colorMap[faceColor],
              colorBlendMode: BlendMode.lighten,
            ),
        );

    // appIcon = Center(child: Text("${app.name}",));

    var icon = Container(
      decoration: BoxDecoration(
          color: colorMap[faceColor],
          border: Border.all(color: Colors.black, width: 1)),
      padding: EdgeInsets.all(10),
      child: appIcon,
    );

    return GestureDetector(
      onTap: () {
        app.rawApp.openApp();
      },
      onLongPress: (){
        app.rawApp.openSettingsScreen();
      },
      child: Container(
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}

var colorMap = {
  FaceColor.YELLOW: Colors.yellow,
  FaceColor.GREEN: Colors.green,
  FaceColor.WHITE: Colors.white,
  FaceColor.BLUE: Colors.blue,
  FaceColor.RED: Colors.redAccent,
  FaceColor.ORANGE: Colors.orange,
  FaceColor.BLACK: Colors.black,
};
