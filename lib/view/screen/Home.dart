import 'package:flutter/material.dart';
import '../material/gridview.dart';
import '../material/listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isTrue = false;

class _HomeScreenState extends State<HomeScreen> {
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
          'Create Post',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 30),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  (isTrue) ? isTrue = false : isTrue = true;
                });
              },
              icon: (isTrue)
                  ? Icon(
                      Icons.list,
                      size: 35,
                    )
                  : Icon(
                      Icons.grid_view_sharp,
                      size: 35,
                    ))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("aasets/img/bg/bg4.jpg"), fit: BoxFit.cover)),
        // child: buildListView(height),
        child:(isTrue)?buildGridView():buildListView(height)
      ),
    );
  }
}