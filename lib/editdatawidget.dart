import 'package:flutter/material.dart';
import 'models/cases.dart';
import 'services/api_service.dart';

enum Gender { masculino, feminino}

enum Status { positive, dead, recovered }

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.cases);

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _nameController = TextEditingController();
  String gender = 'masculino';
  Gender _gender = Gender.masculino;
  final _cpfController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  String status = 'positive';
  Status _status = Status.positive;

  @override
  void initState() {
    id = widget.cases.id;
    _nameController.text = widget.cases.name;
    gender = widget.cases.gender;
    if (widget.cases.gender == 'masculino') {
      _gender = Gender.masculino;
    } else {
      _gender = Gender.feminino;
    }
    _cpfController.text = widget.cases.cpf.toString();
    _addressController.text = widget.cases.address;
    _cityController.text = widget.cases.city;
    _countryController.text = widget.cases.country;
    status = widget.cases.status;
    if (widget.cases.status == 'positive') {
      _status = Status.positive;
    } else if (widget.cases.status == 'dead') {
      _status = Status.dead;
    } else {
      _status = Status.recovered;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar dados de cliente'),
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
                                      gender = 'feminino';
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
                                controller: _cpfController,
                                decoration: const InputDecoration(
                                  hintText: 'CPF',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Por favor informe o CPF';
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
                                    return 'Por favor, informe o país';
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
                                title: const Text('Positive'),
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
                                title: const Text('Dead'),
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
                                title: const Text('Recovered'),
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
                                    api.updateCases(
                                        id,
                                        Cases(
                                            name: _nameController.text,
                                            gender: gender,
                                            cpf: int.parse(_cpfController.text),
                                            address: _addressController.text,
                                            city: _cityController.text,
                                            country: _countryController.text,
                                            status: status,
                                            id: '',
                                            updated: ''));

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
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
