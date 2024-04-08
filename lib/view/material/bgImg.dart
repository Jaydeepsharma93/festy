import 'package:flutter/material.dart';
import '../../utils/listdata.dart';
import '../screen/post.dart';

Widget buildContainer(int index) {
  return Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
            color: Colors.black45,
            blurRadius: 20,
            spreadRadius: 4,
            offset: Offset(6, 8))
      ],
      image: DecorationImage(
          image: AssetImage(festlist[imgIndex]['images'][index])),
    ),
  );
}