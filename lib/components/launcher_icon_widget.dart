import 'package:flutter/material.dart';
import 'package:hacube/cube.dart';

import 'cube.dart';

class LauncherIconWidget extends StatelessWidget {
  final FaceColor faceColor;

  const LauncherIconWidget({Key key, this.faceColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icon =
    // (faceColor == FaceColor.BLACK)
    //     ? Container()
        // : Image.asset(cubeFaceToResource[faceColor]);
    // :
    Container(color: colorMap[faceColor],);

    return GestureDetector(
      onTap: () {
        print(faceColor.toString());
      },
      child: Container(
        decoration: BoxDecoration(
             border: Border.all(color: Colors.black)),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}

var colorMap = {
  FaceColor.YELLOW:Colors.yellow,
  FaceColor.GREEN:Colors.green,
  FaceColor.WHITE:Colors.white,
  FaceColor.BLUE:Colors.blue,
  FaceColor.RED:Colors.redAccent,
  FaceColor.ORANGE:Colors.orange,
  FaceColor.BLACK:Colors.black,
};
