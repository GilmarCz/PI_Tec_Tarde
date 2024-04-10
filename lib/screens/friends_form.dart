// lib/screens/friends_form.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FriendsForm extends StatefulWidget {
  final Function(Map<String, Object?>) addFriend; // Adiciona um parâmetro para a função addFriend

  const FriendsForm({Key? key, required this.addFriend}) : super(key: key);

  @override
  _FriendsFormState createState() => _FriendsFormState(); // Implementa o método createState
}

class _FriendsFormState extends State<FriendsForm> {
  final ImagePicker _picker = ImagePicker();
  List<Map<String, Object?>> friends = [
    {
      'img': 'assets/cm1.jpeg',
      'name': 'Friend 1',
      'age': 25,
    },
    // Add more friends here
  ];

  late XFile? pickedFile = null; // Declare pickedFile como uma variável de instância

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  _addFriend() async {
    try {
      if (_formKey.currentState!.validate()) {
        pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          widget.addFriend({
            'img': pickedFile!.path,
            'name': _nameController.text,
            'age': int.parse(_ageController.text),
          });
          Navigator.pop(context);
        }
      }
    } catch (e) {
      print('Error adding friend: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding friend: $e')),
      );
    }
  }

  _editFriend(int index) async {
    try {
      if (_formKey.currentState!.validate()) {
        pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          setState(() {
            friends[index] = {
              'img': pickedFile!.path,
              'name': _nameController.text,
              'age': int.parse(_ageController.text),
            };
          });
          Navigator.pop(context, friends);
        }
      }
    } catch (e) {
      print('Error editing friend: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error editing friend: $e')),
      );
    }
  }



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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor entre com o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Idade',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor entre com a idade';
                  }
                  int age;
                  try {
                    age = int.parse(value);
                  } catch (e) {
                    return 'Por favor entre com a idade valida';
                  }
                  if (age < 0) {
                    return 'Idade não pode ser negativa';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _addFriend();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
                child: Text('Adicionar amigo'),
              ),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    friends.length,
                        (index) {
                      final friend = friends[index];
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: pickedFile != null
                          ? Image.file(
                          File(pickedFile!.path),
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.2,
                          fit: BoxFit.cover,
                          )
                              : Image.asset(
                          friend['img'] as String,
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.height * 0.2,
                          fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(friend['name'].toString()),
                          Text(friend['age'].toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _editFriend(index);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green, // Altera a cor do botão para verde
                                ),
                                child: Text('Editar'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    friends.removeAt(index);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red, // Altera a cor do botão para vermelho
                                ),
                                child: Text('Excluir'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}