import 'package:api/Data/api/api_service.dart';
import 'package:api/Data/model/article.dart';
import 'package:api/ui/article_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddData extends StatelessWidget {
  static const routeName = '/add_data';
  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _imageController = TextEditingController();
  final _listimage1Controller = TextEditingController();
  final _listimage2Controller = TextEditingController();
  final _listimage3Controller = TextEditingController();
  final _listimage4Controller = TextEditingController();
  final _openController = TextEditingController();
  final _hoursController = TextEditingController();
  final _ticketController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masukkan Data anda'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: 400,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Id'),
                              TextFormField(
                                controller: _idController,
                                decoration: const InputDecoration(
                                  hintText: 'Id',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Name'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Location'),
                              TextFormField(
                                controller: _locationController,
                                decoration: const InputDecoration(
                                  hintText: 'location',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter location';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Image'),
                              TextFormField(
                                controller: _imageController,
                                decoration: const InputDecoration(
                                  hintText: 'urlImage',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter url image';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Description'),
                              TextFormField(
                                controller: _descriptionController,
                                decoration: const InputDecoration(
                                  hintText: 'description',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter desription';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Open'),
                              TextFormField(
                                controller: _openController,
                                decoration: const InputDecoration(
                                  hintText: 'open',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter open';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Hours'),
                              TextFormField(
                                controller: _hoursController,
                                decoration: const InputDecoration(
                                  hintText: 'hours',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter open';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Tikcet'),
                              TextFormField(
                                controller: _ticketController,
                                decoration: const InputDecoration(
                                  hintText: 'ticket',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter open';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Gambar 1'),
                              TextFormField(
                                controller: _listimage1Controller,
                                decoration: const InputDecoration(
                                  hintText: 'gambar 1',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter open';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Gambar 2'),
                              TextFormField(
                                controller: _listimage2Controller,
                                decoration: const InputDecoration(
                                  hintText: 'gambar 2',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter open';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Gambar 3'),
                              TextFormField(
                                controller: _listimage3Controller,
                                decoration: const InputDecoration(
                                  hintText: 'gambar 3',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter open';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Gambar 4'),
                              TextFormField(
                                controller: _listimage4Controller,
                                decoration: const InputDecoration(
                                  hintText: 'gambar 4',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter open';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () async {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.CreatetopHeadlines(
                                        Datum(id: _idController.text,
                                              name: _nameController.text,
                                              location: _locationController.text,
                                              imageAsset: _imageController.text,
                                              deskripsi: _descriptionController.text,
                                              jamBuka: _openController.text,
                                              tiket: _ticketController.text,
                                              waktu: _hoursController.text,
                                              listImage1: _listimage1Controller.text,
                                              listImage2: _listimage2Controller.text,
                                              listImage3: _listimage3Controller.text,
                                              listImage4: _listimage4Controller.text));
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
                                    style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}