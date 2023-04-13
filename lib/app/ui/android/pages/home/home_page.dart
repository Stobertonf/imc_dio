import 'package:flutter/material.dart';
import 'package:imc_dio/app/shared/components/snackBar/message_snack_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with  MessageSnackBar {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  late String _result;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetFields() {
    _weightController.text = '';
    _heightController.text = '';
    setState(() {
      _result = 'Informe seus dados';
    });
  }


  void showErrorMessageSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void calculateImc() {
  double weight = double.tryParse(_weightController.text) ?? 0.0;
  double height = double.tryParse(_heightController.text) ?? 0.0;
  if (weight == 0.0) {
    showErrorMessageSnackBar("Insira um peso válido!");
    return;
  }
  if (height == 0.0) {
    showErrorMessageSnackBar("Insira uma altura válida!");
    return;
  }
  height /= 100.0;
  double imc = weight / (height * height);
  setState(() {
    _result = "IMC = ${imc.toStringAsPrecision(2)}\n";
      if (imc < 18.6)
        _result += "Abaixo do peso";
      else if (imc < 25.0)
        _result += "Peso ideal";
      else if (imc < 30.0)
        _result += "Levemente acima do peso";
      else if (imc < 35.0)
        _result += "Obesidade Grau I";
      else if (imc < 40.0)
        _result += "Obesidade Grau II";
      else
        _result += "Obesidade Grau IIII";
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: buildForm(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Calculadora de IMC',
      ),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            resetFields();
          },
        )
      ],
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTextFormField(
              label: "Peso (kg)",
              error: "Insira seu peso!",
              controller: _weightController),
          buildTextFormField(
              label: "Altura (cm)",
              error: "Insira uma altura!",
              controller: _heightController),
          buildTextResult(),
          buildCalculateButton(),
        ],
      ),
    );
  }

  Padding buildCalculateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 36.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            calculateImc();
          }
        },
        child: const Text(
          'CALCULAR',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Padding buildTextResult() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36.0),
      child: Text(
        _result,
        textAlign: TextAlign.center,
      ),
    );
  }

  TextFormField buildTextFormField({
    required TextEditingController controller,
    required String error,
    required String label,
  }) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
      ),
      controller: controller,
      validator: (text) {
        return text!.isEmpty ? error : null;
      },
    );
  }
}
