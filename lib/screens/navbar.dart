import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:babysitterapp/screens/home.dart';
import 'package:flutter/material.dart';

class NavbarPages extends StatefulWidget {
  const NavbarPages({super.key});

  @override
  State<NavbarPages> createState() => _NavbarPagesState();
}

class _NavbarPagesState extends State<NavbarPages> {
  int indxpage = 0;

  //set pagenav
  late PageController pageCon;
  @override
  void initState() {
    super.initState();
    pageCon = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageCon.dispose();
  }

  void navigationTapped(int page) {
    pageCon.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      indxpage = page;
    });
  }

  //do not exceed 5 icons
  final icnNav = <IconData>[
    Icons.home,
    Icons.explore,
    Icons.notifications,
    Icons.account_circle
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageCon,
        onPageChanged: onPageChanged,
        //use as scaffold
        children: const [
          HomePage(),
          Text('2'),
          Text('3'),
          Text('4'),
          Text('5'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashRadius: 45,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        notchSmoothness: NotchSmoothness.softEdge,
        splashColor: Colors.deepPurple,
        iconSize: 30,
        activeColor: Colors.deepPurple,
        height: 65,
        gapLocation: GapLocation.center,
        icons: icnNav,
        activeIndex: indxpage,
        onTap: navigationTapped,
      ),
    );
  }
}
