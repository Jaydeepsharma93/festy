import 'package:flutter/material.dart';
import '../../utils/listdata.dart';
import '../screen/post.dart';

ListView buildListView(double height) {
  return ListView.builder(
    itemCount: festlist.length,
    itemBuilder: (context, index) => buildPadding(height, index,context),
  );
}

Widget buildPadding(double height, int index,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: InkWell(
      onTap: () {
        imgIndex = index;
        Navigator.pushNamed(context, '/post');
      },
      child: Container(
        alignment: Alignment.center,
        height: height * 0.14,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 20,
                  spreadRadius: 4,
                  offset: Offset(6, 8))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(festlist[index]['Festival'],
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                Text(festlist[index]['word'])
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage(festlist[index]['images'][0]),
              radius: 60,
            )
          ],
        ),
      ),
    ),
  );
}