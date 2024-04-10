// lib/screens/add.dart

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  const Add({required Key key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Adicionar restaurante'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () async {
                  final ImagePicker _picker = ImagePicker();
                  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      // Process the picked file here
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
                child: const Text('Adicionar foto'),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Restaurante',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome para o estabelecimento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Endereço',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o endereço do estabelecimento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final title = _titleController.text;
                    final address = _addressController.text;

                    setState(() {
                      // Process the form data here
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}