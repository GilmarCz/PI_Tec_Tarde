// lib/screens/categories_form.dart

import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  const CategoryForm({Key? key}) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  //final _color1Controller = TextEditingController();
  //final _color2Controller = TextEditingController();
  final _imgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Categoria')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              // TextFormField(
              //   controller: _color1Controller,
              //   decoration: InputDecoration(labelText: 'Cor 1'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Por favor, insira a primeira cor';
              //     }
              //     return null;
              //   },
              // ),
              // TextFormField(
              //   controller: _color2Controller,
              //   decoration: InputDecoration(labelText: 'Cor 2'),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Por favor, insira a segunda cor';
              //     }
              //     return null;
              //   },
              // ),
              TextFormField(
                controller: _imgController,
                decoration: InputDecoration(labelText: 'Imagem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o caminho da imagem';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final category = {
                          'name': _nameController.text,
                          // 'color1': _color1Controller.text,
                          // 'color2': _color2Controller.text,
                          'img': _imgController.text,
                        };
                        print('Category data: $category');
                        // Adicione sua lógica para salvar ou atualizar os dados da categoria
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    ),
                    child: Text('Salvar'),
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
