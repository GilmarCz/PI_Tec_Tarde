// lib/screens/trending.dart

import 'package:flutter/material.dart';
import 'package:foodybite/util/restaurants.dart';
import 'package:foodybite/widgets/search_card.dart';
import 'package:foodybite/widgets/trending_item.dart';

class Trending extends StatelessWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Restaurantes populares"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            SearchCard(key: UniqueKey()),
            const SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = restaurants[index];

                return TrendingItem(
                  key: ValueKey(restaurant["id"]),
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                );
              },
            ),
            const SizedBox(height:10.0),
          ],
        ),
      ),
    );
  }
}