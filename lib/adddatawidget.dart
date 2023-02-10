import 'package:flutter/material.dart';
import 'models/cases.dart';
import 'services/api_service.dart';

enum Gender { masculino, feminino }

enum Status { positive, dead, recovered }

class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String gender = 'masculino';
  Gender _gender = Gender.masculino;
  final cpf = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  String status = 'positive';
  Status _status = Status.positive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar cliente'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Nome completo'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Nome completo',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, informe o nome completo';
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
                              Text('Gênero'),
                              ListTile(
                                title: const Text('Masculino'),
                                leading: Radio(
                                  value: Gender.masculino,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value!;
                                      gender = 'masculino';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Feminino'),
                                leading: Radio(
                                  value: Gender.feminino,
                                  groupValue: _gender,
                                  onChanged: (Gender? value) {
                                    setState(() {
                                      _gender = value!;
                                      gender = 'masculino';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('CPF'),
                              TextFormField(
                                controller: cpf,
                                decoration: const InputDecoration(
                                  hintText: 'CPF',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, informe o CPF';
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
                              Text('Endereço'),
                              TextFormField(
                                controller: _addressController,
                                decoration: const InputDecoration(
                                  hintText: 'Endereço',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, informe o endereço';
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
                              Text('Cidade'),
                              TextFormField(
                                controller: _cityController,
                                decoration: const InputDecoration(
                                  hintText: 'Cidade',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, informe a cidade';
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
                              Text('País'),
                              TextFormField(
                                controller: _countryController,
                                decoration: const InputDecoration(
                                  hintText: 'País',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor, informe o nome do país';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        /*Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Status'),
                              ListTile(
                                title: const Text('Positivo'),
                                leading: Radio(
                                  value: Status.positive,
                                  groupValue: _status,
                                  onChanged: (Status? value) {
                                    setState(() {
                                      _status = value!;
                                      status = 'positive';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Morto'),
                                leading: Radio(
                                  value: Status.dead,
                                  groupValue: _status,
                                  onChanged: (Status? value) {
                                    setState(() {
                                      _status = value!;
                                      status = 'dead';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Recuperado'),
                                leading: Radio(
                                  value: Status.recovered,
                                  groupValue: _status,
                                  onChanged: (Status? value) {
                                    setState(() {
                                      _status = value!;
                                      status = 'recovered';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),*/
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.createCase(Cases(
                                        name: _nameController.text,
                                        gender: gender,
                                        cpf: int.parse(cpf.text),
                                        address: _addressController.text,
                                        city: _cityController.text,
                                        country: _countryController.text,
                                        status: status,
                                        updated: '',
                                        id: ''));

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Salvar',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
