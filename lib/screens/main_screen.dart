// lib/screens/main_screen.dart

import 'package:flutter/material.dart';
import 'package:foodybite/screens/add.dart';
import 'package:foodybite/screens/home.dart';
import 'package:foodybite/screens/restaurant_form.dart';
import 'package:foodybite/screens/friends_form.dart';
import 'package:foodybite/screens/categories_form.dart';
import 'package:foodybite/util/friends.dart';

class MainScreen extends StatefulWidget {
  final List<Map<String, Object?>> friends;

  const MainScreen({Key? key, required this.friends}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  List icons = [
    Icons.house,
    Icons.restaurant,
    Icons.add_box,
    Icons.category,
    Icons.group_add,
  ];

  @override
  Widget build(BuildContext context) {
    List pages = [
      Home(key: UniqueKey()),
      RestaurantForm(key: UniqueKey()),
      Add(key: UniqueKey()),
      CategoryForm(key: UniqueKey()),
      FriendsForm(key: UniqueKey(), addFriend: _addFriend),
    ];

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(5, (index) => pages[index]),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildTabIcon(0),
            buildTabIcon(1),
            buildTabIcon(3),
            buildTabIcon(4),
          ],
        ),
      ),
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   elevation: 10.0,
      //   child: const Icon(
      //     Icons.add,
      //   ),
      //   onPressed: () => _pageController.jumpToPage(2),
      // ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void _addFriend(Map<String, Object?> newFriend) {
    setState(() {
      widget.friends.add(newFriend);
    });
  }

  Widget buildTabIcon(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(index == 3 ? 30 : 0, 0, index == 1 ? 30 : 0, 0),
      child: IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
        ),
        color: _page == index
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).textTheme.bodyMedium?.color,
        onPressed: () => _pageController.jumpToPage(index),
      ),
    );
  }
}