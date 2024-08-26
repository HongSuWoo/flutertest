import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CoffeeCardForm(),
    );
  }
}

class CoffeeCardForm extends StatefulWidget {
  @override
  _CoffeeCardFormState createState() => _CoffeeCardFormState();
}

class _CoffeeCardFormState extends State<CoffeeCardForm> {
  final _formKey = GlobalKey<FormState>();
  String? firstInput;
  String? secondInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Image section
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 200,
                color: Colors.green[200],
                child: Center(
                  child: Icon(Icons.image, size: 50),
                ),
              ),
              // First Input Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: '값을 입력하세요',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  firstInput = value;
                },
              ),
              SizedBox(height: 20),
              // Second Input Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: '값을 입력하세요',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  secondInput = value;
                },
              ),
              SizedBox(height: 20),
              // Save Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the inputs
                    print('First Input: $firstInput');
                    print('Second Input: $secondInput');
                  }
                },
                child: Text('저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}