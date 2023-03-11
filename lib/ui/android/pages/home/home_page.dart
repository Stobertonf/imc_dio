
import 'package:flutter/material.dart';
import 'package:imc/blocs/imc.bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cálculos IMC",
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: bloc.heightCtrl,
              decoration: const InputDecoration(
                labelText: "Altura (cm)",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: bloc.weigthCtrl,
              decoration: const InputDecoration(
                labelText: "Peso (KG)",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              bloc.result,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              child: const Text(
                "CALCULAR",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  bloc.calculate();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
