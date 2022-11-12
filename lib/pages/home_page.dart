import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myinsta/pages/myfeedPage.dart';
import 'package:flutter_myinsta/pages/mylikes_page.dart';
import 'package:flutter_myinsta/pages/myprofil_page.dart';
import 'package:flutter_myinsta/pages/mysearch_page.dart';
import 'package:flutter_myinsta/pages/myupload_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     var _pageController = PageController();
  int _currentTap = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController,
        children: [
          MyFeedPage(pageController:_pageController),
          MySearchPage(),
          MyUploadPage(pageController: _pageController,),
          MyLikesPage(),
          MyProfilPage()
        ],
        onPageChanged: (int index){
        setState(() {
          _currentTap = index;
        });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Color.fromRGBO(131, 58, 180, 1),
        currentIndex: _currentTap,
        onTap: (int index){
          setState(() {
            _currentTap = index;
            _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          });
        }, items: [
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
            backgroundColor: Colors.grey,

      ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          backgroundColor: Colors.grey,

        ),  BottomNavigationBarItem(
          icon: Icon(Icons.add_box),
          backgroundColor: Colors.grey,

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          backgroundColor: Colors.grey,

        ),  BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          backgroundColor: Colors.grey,

        )
      ],
      ),
    );
  }
}
