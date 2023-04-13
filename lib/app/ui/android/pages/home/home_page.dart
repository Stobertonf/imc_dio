import 'package:flutter/material.dart';
import 'package:imc_dio/app/shared/components/snackBar/message_snack_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with  MessageSnackBar {
  late String _result;
  List<double> imcList = [];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();

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
      imcList.clear();
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
      else if (imc < 24.9)
        _result += "Peso ideal";
      else if (imc < 29.9)
        _result += "Levemente acima do peso";
      else if (imc < 34.9)
        _result += "Obesidade Grau I";
      else if (imc < 39.9)
        _result += "Obesidade Grau II";
      else
        _result += "Obesidade Grau III";
    imcList.add(imc);
  });
}

Widget buildIMCList() {
  return SizedBox(
    height: 200,
    child: ListView.builder(
      itemCount: imcList.length,
      itemBuilder: (BuildContext context, int index) {
        double imc = imcList[index];
        String message = "IMC = ${imc.toStringAsPrecision(2)} ";
        if (imc < 18.6)
          _result += "Abaixo do peso";
        else if (imc < 50.0)
          _result += "Peso ideal";
        else if (imc < 60.0)
          _result += "Levemente acima do peso";
        else if (imc < 75.0)
          _result += "Obesidade Grau I";
        else if (imc < 90.0)
          _result += "Obesidade Grau II";
        else
          _result += "Obesidade Grau IIII";
        return ListTile(
          title: Text(message),
        );
      },
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Scaffold(
        appBar: buildAppBar(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: buildForm(),
        ),
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
           buildIMCList(),
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
