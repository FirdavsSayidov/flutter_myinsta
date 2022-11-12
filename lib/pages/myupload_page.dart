import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';



class MyUploadPage extends StatefulWidget {

   
    var pageController = PageController();
    MyUploadPage({required this.pageController});
  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  var captionController = TextEditingController();

  File? _image;

  final picker = ImagePicker();
  _imgFromGallery() async {
    XFile? image =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    print(image!.path.toString());
    setState(() {
      _image = File(image.path);
    });
    // _apiChangePhoto();
  }

  _imgFromCamera() async {
    XFile? image =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    print(image!.path.toString());
    setState(() {
      _image = File(image.path);
    });
    //_apiChangePhoto();
  }



  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading:  Icon(Icons.photo_library),
                      title:  Text('Pick Photo'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading:  const Icon(Icons.photo_camera),
                    title:  const Text('Take Photo'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 0,
      title: Text('Upload',style: TextStyle(color: Colors.black,fontFamily: 'Billabong',fontSize: 30),),
      backgroundColor: Colors.white,
    actions: [
      IconButton(onPressed: (){
     widget.pageController.animateToPage(0, duration: Duration(microseconds: 1), curve: Curves.bounceIn);

      }, icon: Icon(Icons.post_add,color: Colors.red,))
    ],
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(onTap: (){
              _showPicker(context);
            },
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,

                child: _image ==null ? Center(
                  child: Icon(Icons.add_a_photo,size: 50,color: Colors.grey,),
                ):
                    Stack(
                      children: [
                        Image.file(_image!,width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){
                             setState(() {
                               _image = null;
                             });
                            }, icon: Icon(Icons.highlight_remove_outlined,color: Colors.white,))
                          ],
                        )
                      ],
                    ),

              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 10),
              child: TextField(controller: captionController,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Caption',
                  hintStyle: TextStyle(fontSize: 17,color: Colors.black38),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
