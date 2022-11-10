import 'package:flutter/material.dart';
import 'package:flutter_myinsta/image/images.dart';

import '../model/user_model.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  List<Userr> items = [];
  var searchController = TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));
    items.add(Userr(fullname: "Firdavs", email: 'fsaidov167@gmail.com'));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        title: Text('Search',
        style: TextStyle(fontSize: 30,fontFamily: 'Billabong',color: Colors.black),
        ),
      ),
      body: Container(
  padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(height: 45,
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200
            ),
            child: TextField(controller: searchController,
              cursorColor: Colors.grey,
              style: TextStyle(color: Colors.black87),
              onChanged: (input){
              print(input);
              },
              decoration: InputDecoration(
                icon: Icon(Icons.search_rounded),
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx,i){
                    return itemOf(items[i]);
                  }),
            ),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
  Widget itemOf(Userr user){
    return Container(height: 75,
      child: Row(
        children: [
              Container(padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  border: Border.all(
                    width: 1.5,
                    color: Color.fromRGBO(193, 53, 132, 1)
                  )
                ),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                  child: Image(
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    image: AssetImage(imageAll[0]),
                  ),
                ),
              ),
          SizedBox(width: 15,),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.fullname,
              style: TextStyle(
                color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              ),
              Text(user.email,
              style: TextStyle(
                color: Colors.grey
              ),
              )
            ],
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade400
                  )
                ),
                child: Center(child: Text('Follow',style: TextStyle(
                  color: Colors.grey.shade600

                ),)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
