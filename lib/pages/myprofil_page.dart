import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/image/images.dart';
import 'package:flutter_myinsta/model/post_model.dart';
import 'package:flutter_myinsta/services/auth_services.dart';
import 'package:image_picker/image_picker.dart';

class MyProfilPage extends StatefulWidget {
  const MyProfilPage({super.key});



  @override
  State<MyProfilPage> createState() => _MyProfilPageState();
}

class _MyProfilPageState extends State<MyProfilPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
 List<Post> items = [];
 String post_img1 = 'https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost.png?alt=media&token=f0b1ba56-4bf4-4df2-9f43-6b8665cdc964';
 String post_img2 = 'https://firebasestorage.googleapis.com/v0/b/koreanguideway.appspot.com/o/develop%2Fpost2.png?alt=media&token=ac0c131a-4e9e-40c0-a75a-88e586b28b72';
 @override
 void initState() {
   // TODO: implement initState
   super.initState();
   items.add(Post(caption: 'Discover more great images on our sponsor`s site', postImage: post_img1));
   items.add(Post(caption: 'Discover more great images on our sponsor`s site', postImage: post_img2));

 }


  _imgFromGallery() async {
    XFile? image =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    print(image!.path.toString());
    setState(() {
      _image = File(image.path);
    });
   // _apiChangePhoto();
  }

  _imgFromCamera() async {
    XFile? image =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
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
      appBar: AppBar(backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Profile',
        style: TextStyle(fontFamily: 'Billabong',fontSize: 30,color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: (){
            AuthService.removeUser(context);
          }, icon: Icon(Icons.exit_to_app,color: Colors.black,))
        ],
      ),
      body: Container(width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(padding: EdgeInsets.all(1),
                
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    border: Border.all(
                      width: 1.5,
                      color: Color.fromRGBO(193, 53, 132, 1)
                    )
                  ),
                  child: Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: _image == null ? Image(
                        height: 80,
                        width: 80,
                        image: AssetImage(imageAll[0]),
                      ):
                          Image.file(_image!,
                            height: 80,width: 80,
                            fit: BoxFit.cover,)
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    _showPicker(context);
                  },
                  child: Container(height: 80,width: 80,
                      margin: EdgeInsets.all(7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.add_circle,color: Colors.purple),
                      Container()
                    ],
                  )),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text('Firdavs',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            Text('fsaidov167@gmail.com',
            style: TextStyle(color: Colors.grey.shade600),
            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                children: [
                  Expanded(child: Column(

                    children: const [
                      Text('675',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      Text('Posts',style: TextStyle(color: Colors.grey),)
                    ],
                  ),

                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.grey.shade300,
                  ),
                  Expanded(child: Column(

                    children: [
                      Text('4,562',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      Text('Followers',style: TextStyle(color: Colors.grey),)
                    ],
                  ),

                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.grey.shade300,
                  ),
                  Expanded(child: Column(

                    children: [
                      Text('897',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                      Text('Following',style: TextStyle(color: Colors.grey),)
                    ],
                  ),

                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),

            Expanded(
              child: GridView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx,i){
                    return itemOfPost(items[i]);
                  }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 ),),
            ),
          ],
        ),
      )
    );
  }
  Widget itemOfPost(Post post){
   return Container(
     margin: EdgeInsets.all(5),
     child: Column(
       children: [
         Expanded(
           child: CachedNetworkImage(
             width: double.infinity,
               imageUrl: post.postImage,
              errorWidget: (context,url,error) => const Icon(Icons.error),
             placeholder: (context,url) => const CircularProgressIndicator(),
             fit: BoxFit.cover,
           ),
         ),
         Text(post.caption)
       ],
     ),
   );
  }
}
