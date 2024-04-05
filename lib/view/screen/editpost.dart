import 'package:festy/view/screen/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/listdata.dart';

class EditPost extends StatefulWidget {
  const EditPost({super.key});

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink.shade200,
        title: Text(
          'Edit Template',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: height * 0.85,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("aasets/img/bg/bg4.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    height: 460,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black45,
                              blurRadius: 20,
                              spreadRadius: 4,
                              offset: Offset(6, 8))
                        ],
                        image: DecorationImage(
                            image: AssetImage(festlist[imgIndex]['images'][0]),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.pinkAccent.shade100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.gradient,
                          size: 45,
                        )),
                    Text(
                      "Canvas",
                      style: TextStyle(fontSize: 18, height: -0.01),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.text_fields,
                          size: 45,
                        )),
                    Text(
                      "Text",
                      style: TextStyle(fontSize: 18, height: -0.01),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          size: 45,
                        )),
                    Text(
                      "Share",
                      style: TextStyle(fontSize: 18, height: -0.01),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.save_alt,
                          size: 45,
                        )),
                    Text(
                      "Save",
                      style: TextStyle(fontSize: 18, height: -0.01),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
