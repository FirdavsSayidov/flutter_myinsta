import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class MyLikesPage extends StatefulWidget {
  const MyLikesPage({Key? key}) : super(key: key);

  @override
  State<MyLikesPage> createState() => _MyLikesPageState();
}

class _MyLikesPageState extends State<MyLikesPage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,centerTitle: true,
        title: Text('Likes',style: TextStyle(fontFamily: 'Billabong',fontSize: 30,color: Colors.black),),

      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx,index){
            return _itemOfPost(items[index]);
          }),
    );
  }
  Widget _itemOfPost(Post post){
    return Container(
      padding: EdgeInsets.all(1),
      child: Column(
        children: [
          Divider(),
          Container(padding: EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/person.png'),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children: [
                        Text('username',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                        SizedBox(height: 5,),
                        Text('2022-11-02')
                      ],
                    )
                  ],
                ),
                IconButton(onPressed: (){},
                    icon: const Icon(Icons.more_horiz,size: 30,))
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: post.postImage,
            fit: BoxFit.cover,
            placeholder: (context,url,) => CircularProgressIndicator(),
            errorWidget: (context,url,error) => Icon(Icons.error),

          ),

          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.send))

            ],
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 10,bottom: 10,right: 10),
            child: RichText(
              overflow: TextOverflow.visible,
              softWrap: true,
              text: TextSpan(
                  children: [
                    TextSpan(
                        text: '${post.caption}',style: TextStyle(color: Colors.black)
                    )
                  ]
              ),

            ),
          )

        ],
      ),
    );
  }
}

