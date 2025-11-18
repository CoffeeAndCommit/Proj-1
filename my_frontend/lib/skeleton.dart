import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_frontend/page/post_page.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int currentIndex = 0;
  List pages = [
    GetPage(),
    // PostPage()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },

        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Get"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Post"),
          
        ],
      )
    );
  }
}
