// lib/screens/home.dart

import 'package:flutter/material.dart';
import 'package:foodybite/screens/categories.dart';
import 'package:foodybite/screens/trending.dart';
import 'package:foodybite/screens/friends.dart'; // Importe a tela de amigos
import 'package:foodybite/util/categories.dart';
import 'package:foodybite/util/friends.dart';
import 'package:foodybite/util/restaurants.dart';
import 'package:foodybite/widgets/category_item.dart';
import 'package:foodybite/widgets/search_card.dart';
import 'package:foodybite/widgets/slide_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories;
    List<Map<String, dynamic>> restaurants;
    List<Map<String, dynamic>> friends;

    // Initialize categories, restaurants, and friends with data

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: ListView(
            children: <Widget>[
              buildSearchBar(context),
              const SizedBox(height: 20.0),
              buildRestaurantRow('Restaurantes Populares', context),
              const SizedBox(height: 10.0),
              buildRestaurantList(context),
              const SizedBox(height: 10.0),
              buildCategoryRow('Categorias', context),
              const SizedBox(height: 10.0),
              buildCategoryList(context),
              const SizedBox(height: 20.0),
              buildFriendsRow('Amigos', context),
              const SizedBox(height: 10.0),
              buildFriendsList(context),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }

  buildRestaurantRow(String restaurant, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          restaurant,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Trending();
                },
              ),
            );
          },
          child: Text(
            "Ver tudo1",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          category,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Categories();
                },
              ),
            );
          },
          child: Text(
            "Ver tudo2",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  buildFriendsRow(String friends, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          friends,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return FriendsScreen();
                },
              ),
            );
          },
          child: Text(
            "Ver tudo3",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }

  buildSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: SearchCard(),
    );
  }

  buildCategoryList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // ignore: unnecessary_null_comparison
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> cat = categories[index] as Map<String, dynamic>;

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildRestaurantList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        // ignore: unnecessary_null_comparison
        itemCount: restaurants == null ? 0 : restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = restaurants[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              key: ValueKey(restaurant["id"]), // Assuming "id" is a unique identifier for each restaurant
              img: restaurant["img"],
              title: restaurant["title"],
              address: restaurant["address"],
              rating: restaurant["rating"],
            ),

          );
        },
      ),
    );
  }

  buildFriendsList(BuildContext context) { // Adicione o contexto como argumento
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        // ignore: unnecessary_null_comparison
        itemCount: friends == null ? 0 : friends.length,
        itemBuilder: (BuildContext context, int index) {
          String img = friends[index];

          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                img,
              ),
              radius: 25.0,
            ),
          );
        },
      ),
    );
  }
}

