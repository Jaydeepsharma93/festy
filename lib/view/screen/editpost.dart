import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:festy/view/screen/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import '../../utils/fontlist.dart';
import '../../utils/listdata.dart';
import '../material/bgImg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPost extends StatefulWidget {
  const EditPost({super.key});

  @override
  State<EditPost> createState() => _EditPostState();
}

int fontIndex = 0;
double size = 20;
int bgIndex = 0;
GlobalKey imgkey = GlobalKey();
TextEditingController txtText = TextEditingController();
Alignment align = Alignment.center;

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
        title: const Text(
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
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("aasets/img/bg/bg4.jpg"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  RepaintBoundary(
                    key: imgkey,
                    child: Container(
                      height: 460,
                      width: 450,
                      alignment: align,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black45,
                                blurRadius: 20,
                                spreadRadius: 4,
                                offset: Offset(6, 8))
                          ],
                          image: DecorationImage(
                              image: AssetImage(
                                  festlist[imgIndex]['images'][bgIndex]),
                              fit: BoxFit.cover)),
                      child: Text(txtText.text,
                          style: GoogleFonts.getFont(fontfamilylist[fontIndex],
                              textStyle: TextStyle(fontSize: size))),
                    ),
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
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 258,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'background image',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.east_rounded)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            children: List.generate(
                                                festlist[imgIndex]['images']
                                                    .length,
                                                (index) => Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 30,
                                                        horizontal: 10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          bgIndex = index;
                                                        });
                                                      },
                                                      child:
                                                          buildContainer(index),
                                                    )))),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.gradient,
                          size: 45,
                        )),
                    const Text(
                      "Canvas",
                      style: TextStyle(fontSize: 18, height: -0.01),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 20),
                                  child: Column(
                                    children: [
                                      TextField(
                                        textInputAction: TextInputAction.done,
                                        controller: txtText,
                                        decoration: InputDecoration(
                                            hintText: 'Edit Text',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text("Fornt Size"),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          size = size + 2;
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          size = size - 2;
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ],
                                              )
                                            ],
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 160,
                                                      width: double.infinity,
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children:
                                                              List.generate(
                                                            fontfamilylist
                                                                .length,
                                                            (index) =>
                                                                TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  fontIndex = index;
                                                                });
                                                              },
                                                              child: Text(
                                                                  'Edit Font Family',
                                                                  style: GoogleFonts.getFont(
                                                                      fontfamilylist[
                                                                          index],
                                                                      textStyle:
                                                                          TextStyle(
                                                                              fontSize: 20))),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Text("Font Family")),
                                          Column(
                                            children: [
                                              Text("Fornt Alignment"),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          align = Alignment
                                                              .centerLeft;
                                                        });
                                                      },
                                                      icon: Icon(Icons
                                                          .format_align_left)),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          align =
                                                              Alignment.center;
                                                        });
                                                      },
                                                      icon: Icon(Icons
                                                          .format_align_center)),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          align = Alignment
                                                              .centerRight;
                                                        });
                                                      },
                                                      icon: Icon(Icons
                                                          .format_align_right)),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.text_fields,
                          size: 45,
                        )),
                    const Text(
                      "Text",
                      style: TextStyle(fontSize: 18, height: -0.01),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          final boundary = imgkey.currentContext!
                              .findRenderObject() as RenderRepaintBoundary;
                          ui.Image image = await boundary.toImage();
                          ByteData? bytedata = await image.toByteData(
                              format: ui.ImageByteFormat.png);
                          var imgData = bytedata!.buffer.asUint8List();
                          if (imgData != null) {
                            final directory =
                                await getApplicationDocumentsDirectory();
                            File fileImage = await File(
                                    '${directory.path}/${festlist[imgIndex]['Festival']}.png')
                                .create();
                            fileImage.writeAsBytesSync(imgData);
                            await ShareExtend.share(fileImage.path, 'festival');
                          }
                        },
                        icon: const Icon(
                          Icons.share,
                          size: 45,
                        )),
                    const Text(
                      "Share",
                      style: TextStyle(fontSize: 18, height: -0.01),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          final boundary = imgkey.currentContext!
                              .findRenderObject() as RenderRepaintBoundary;
                          ui.Image image = await boundary.toImage();
                          ByteData? bytedata = await image.toByteData(
                              format: ui.ImageByteFormat.png);
                          var imgData = bytedata!.buffer.asUint8List();
                          await ImageGallerySaver.saveImage(imgData!,
                              name: 'quote.png', quality: 100);
                        },
                        icon: const Icon(
                          Icons.save_alt,
                          size: 45,
                        )),
                    const Text(
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
