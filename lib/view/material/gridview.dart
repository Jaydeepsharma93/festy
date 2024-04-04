import 'package:flutter/material.dart';
import '../../utils/listdata.dart';
import '../screen/post.dart';

GridView buildGridView() {
  return GridView.builder(
    itemCount: festlist.length,
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        mainAxisExtent:280),
    itemBuilder: (context, index) => buildgrid(index,context),
  );
}

Widget buildgrid(int index,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: InkWell(
      onTap: () {
        imgIndex = index;
        Navigator.pushNamed(context, '/post');
      },
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(festlist[index]['images'][0]),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Text(festlist[index]['Festival'],
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    ),
  );
}