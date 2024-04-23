// lib/bd/databasehelper.dart

import 'package:flutter/foundation.dart';
import 'package:foodybite/screens/restaurant_form.dart';
import 'dart:convert';
//import 'dart:html' as html;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:foodybite/util/restaurants.dart';



class DatabaseHelper {
  static final _databaseName = "RestaurantDatabase.db";
  static final _databaseVersion = 1;

  static final table = "restaurant_table";
  static final columnId = "id";
  static final columnTitle = "title";
  static final columnAddress = "address";
  static final columnRating = "rating";
  static final columnImg = "img";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database!= null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<String> getApplicationDocumentsDirectory() async {
    if (kIsWeb) {
      return 'web'; // Just a placeholder; you can adjust this as needed
    } else {
      // Use a biblioteca path_provider para obter o diretório de documentos do aplicativo
      Directory appDocDir = (await getApplicationDocumentsDirectory()) as Directory;
      return appDocDir.path;
    }
  }

  _initDatabase() async {
    String documentsDirectory = await getApplicationDocumentsDirectory();
    // Use documentsDirectory as needed in your path construction
  }


  Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $table($columnId INTEGER PRIMARY KEY, $columnTitle TEXT, $columnAddress TEXT, $columnRating REAL, $columnImg TEXT)",
    );
  }

  Future<int> insertRestaurant(Restaurant restaurant) async {
    Database db = await instance.database;
    return await db.insert(
      table,
      restaurant.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getRestaurants() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> updateRestaurant(Restaurant restaurant) async {
    Database db = await instance.database;
    return await db.update(
      table,
      restaurant.toMap(),
      where: '$columnId =?',
      whereArgs: [restaurant.id],
    );
  }

  Future<int> deleteRestaurant(int id) async {
    Database db = await instance.database;
    return await db.delete(
      table,
      where: '$columnId =?',
      whereArgs: [id],
    );
  }
}

class Restaurant {
  int id;
  String title;
  String address;
  double rating;
  String img;

  Restaurant({required this.id, required this.title, required this.address, required this.rating, required this.img});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'address': address,
      'rating': rating,
      'img': img,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'address': address,
      'rating': rating,
      'img': img,
    };
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      title: json['title'],
      address: json['address'],
      rating: json['rating'],
      img: json['img'],
    );
  }
}

List<Map<String, dynamic>> getCategories() {
  return [
    {
      "id": 1,
      "name": "Categoria 1",
      "icon": Icons.category,
    },
    {
      "id": 2,
      "name": "Categoria 2",
      "icon": Icons.category,
    },
    // Adicione mais categorias conforme necessário
  ];
}

List<Map<String, dynamic>> getRestaurants() {
  return [
    {
      "id": 1,
      "img": "assets/restaurant1.jpeg",
      "title": "Restaurante 1",
      "address": "Endereço 1",
      "rating": 4.5,
    },
    {
      "id": 2,
      "img": "assets/restaurant2.jpeg",
      "title": "Restaurante 2",
      "address": "Endereço 2",
      "rating": 4.0,
    },
    // Adicione mais restaurantes conforme necessário
  ];
}

List<String> getFriends() {
  return [
    "assets/friend1.jpeg",
    "assets/friend2.jpeg",
    // Adicione mais amigos conforme necessário
  ];
}