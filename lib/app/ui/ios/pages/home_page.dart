import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:imc_dio/blocs/imc.bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = ImcBloc();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Cálculo de IMC"),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CupertinoTextField(
              placeholder: "Altura (cm)",
              controller: bloc.heightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CupertinoTextField(
              placeholder: "Peso (kg)",
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CupertinoTextField(
              placeholder: "Você está fora de Forma, vai pra academia!!!",
              controller: bloc.weigthCtrl,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CupertinoButton(
              child: const Text(
                "Calcular",
              ),
              onPressed: () {
                setState(
                  () {
                    bloc.calculate();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
