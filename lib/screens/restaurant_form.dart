// lib/screens/restaurant_form.dart

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:foodybite/bd/databasehelper.dart';
import 'package:foodybite/util/restaurants.dart';

class RestaurantForm extends StatefulWidget {
  const RestaurantForm({Key? key}) : super(key: key);

  @override
  _RestaurantFormState createState() => _RestaurantFormState();
}

class _RestaurantFormState extends State<RestaurantForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _addressController = TextEditingController();
  File? _image;
  double _rating = 4.5;
  String? imageUrl;
  final dbHelper = DatabaseHelper.instance;

  Future<String> _uploadImage(File imageFile) async {
    final request = http.MultipartRequest('POST', Uri.parse('https://your-server.com/upload-image'));
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
    final response = await request.send();
    if (response.statusCode == 200) {
      return await response.stream.transform(utf8.decoder).join();
    } else {
      throw Exception('Erro ao carregar imagem');
    }
  }

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      String newImageName = imageFile.path.split('/').last;
      final Directory directory = await getApplicationDocumentsDirectory();
      final Directory appDocDir = directory;
      final String appDocPath = appDocDir.path;
      final newImagePath = '$appDocPath/$newImageName';
      final newImage = await imageFile.copy(newImagePath);
      imageUrl = await _uploadImage(newImage);
      setState(() {
        _image = newImage;
      });
    }
  }

  Future<void> _saveRestaurant() async {
    if (_formKey.currentState!.validate()) {
      final restaurant = Restaurant(
        id: 0,
        title: _titleController.text,
        address: _addressController.text,
        rating: _rating,
        img: imageUrl ?? '',
      );
      final id = await dbHelper.insertRestaurant(restaurant);
      restaurant.id = id;
      restaurants.add(restaurant.toJson());
      Navigator.pop(context); // Pop the form screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Restaurante')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _getImage,
                child: _image != null
                    ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
                    : Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey,
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 50),
                ),
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Endereço'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um endereço';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Text('Avaliação: $_rating'),
                  Slider(
                    value: _rating,
                    min: 0,
                    max: 5,
                    divisions: 10,
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final restaurant = Restaurant(
                      id: 0,
                      title: _titleController.text,
                      address: _addressController.text,
                      rating: _rating,
                      img: imageUrl ?? '',
                    );
                    _saveRestaurant();
                    print('Restaurant data: $restaurant');
                    // Add your logic to save or update the restaurant data
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Define a cor do texto
                ),
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}