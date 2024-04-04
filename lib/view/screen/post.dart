import 'package:flutter/material.dart';
import '../../utils/listdata.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}
int imgIndex = 0;
class _PostState extends State<Post> {
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
      ),
      body: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("aasets/img/bg/bg4.jpg"), fit: BoxFit.cover)),
          // child: buildListView(height),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  height: 430,
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
                       fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                decoration:BoxDecoration(
                  color: Colors.pink.shade200,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                  child: Text('Edit Template',style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 30
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}