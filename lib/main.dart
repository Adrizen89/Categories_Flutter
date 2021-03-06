import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SelectFormField Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  TextEditingController? _controller;
  //String _initialValue;
  String _valueChanged = '';
  String _valueToValidate = '';
  String _valueSaved = '';

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'allValue',
      'label': 'Tous',
      'icon': Icon(Icons.all_inbox),
    },
    {
      'value': 'sportValue',
      'label': 'Sport',
      'icon': Icon(Icons.sports),
    },
    {
      'value': 'informatiqueValue',
      'label': 'Informatique',
      'icon': Icon(Icons.computer),
    },
    {
      'value': 'sciencesValue',
      'label': 'Sciences',
      'icon': Icon(Icons.science),
    },
  ];

  /*final List<Map<String, dynamic>> _items = [
    {'value': 1},
    {'value': 2},
    {'value': 3},
    {'value': 4},
    {'value': 5},
    {'value': 6},
    {'value': 7},
    {'value': 8},
    {'value': 9},
    {'value': 10},
    {'value': 11},
    {'value': 12},
    {'value': 13},
    {'value': 14},
    {'value': 15},
    {'value': 16},
    {'value': 17},
    {'value': 18},
    {'value': 19},
    {'value': 20},
    {'value': 21},
    {'value': 22},
    {'value': 23},
    {'value': 24},
    {'value': 25},
    {'value': 26},
    {'value': 27},
    {'value': 28},
    {'value': 29},
    {'value': 30},
    {'value': 31},
  ];*/

  @override
  void initState() {
    super.initState();

    //_initialValue = 'starValue';
    _controller = TextEditingController(text: '2');

    _getValue();
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        //_initialValue = 'circleValue';
        _controller?.text = 'sportValue';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste d??roulante'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _oFormKey,
          child: Column(
            children: <Widget>[
              SelectFormField(
                type: SelectFormFieldType.dialog,
                controller: _controller,
                //initialValue: _initialValue,
                icon: Icon(Icons.collections_bookmark),
                labelText: 'Choisir la cat??gorie',
                changeIcon: true,
                dialogTitle: 'Choisissez une cat??gorie',
                dialogCancelBtn: 'Fermer',
                enableSearch: true,
                dialogSearchHint: 'Rechercher une cat??gorie',
                items: _items,
                onChanged: (val) => setState(() => _valueChanged = val),
                validator: (val) {
                  setState(() => _valueToValidate = val ?? '');
                  return null;
                },
                onSaved: (val) => setState(() => _valueSaved = val ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}