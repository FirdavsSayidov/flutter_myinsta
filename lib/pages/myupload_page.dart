import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MyUploadPage extends StatefulWidget {
  const MyUploadPage({Key? key}) : super(key: key);

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  var captionController = TextEditingController();

  File? _image;
  final picker = ImagePicker();

  Future _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
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
        setState(() {
          _image = null;
        });
      }, icon: Icon(Icons.post_add,color: Colors.red,))
    ],
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(onTap: (){
              _getImage();
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
                        Image.file(_image!,width: double.infinity,height: double.infinity,fit: BoxFit.cover,)
                      ],
                    )
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
