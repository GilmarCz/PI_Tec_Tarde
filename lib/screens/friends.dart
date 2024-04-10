// lib/screens/friends.dart

import 'package:flutter/material.dart';
import 'package:foodybite/util/friends.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Amigos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
          itemCount: friends.length,
          itemBuilder: (BuildContext context, int index) {
            var friendImg = friends[index];
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  friendImg,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
