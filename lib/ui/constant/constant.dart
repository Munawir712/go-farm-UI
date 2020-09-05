import 'package:flutter/material.dart';

//* Constant Color
Color primaryColor = Color(0xff58bb77);

//* Device size
double deviceWith(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
Orientation deviceOrient(BuildContext context) {
  return MediaQuery.of(context).orientation;
}