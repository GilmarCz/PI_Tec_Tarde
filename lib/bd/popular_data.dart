// lib/bd/popular_data.dart

import 'package:foodybite/bd/databasehelper.dart';
import 'package:foodybite/util/restaurants.dart';

void populateDatabase() async {
  final dbHelper = DatabaseHelper.instance;

  for (var restaurantData in restaurants) {
    final restaurant = Restaurant(
      id: 0, // O ID será gerado automaticamente
      title: restaurantData['title'],
      address: restaurantData['address'],
      rating: double.parse(restaurantData['rating']),
      img: restaurantData['img'],
    );
    await dbHelper.insertRestaurant(restaurant);
  }
}

