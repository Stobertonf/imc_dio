import 'package:flutter/material.dart';
import 'package:imc_dio/app/shared/color_palette.dart';
import 'package:imc_dio/blocs/imc.bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: bloc.weigthCtrl,
              decoration: const InputDecoration(
                labelText: "Peso (KG)",
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: textColor,
                  fontFamily: 'Poppins',
                ),
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
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  bloc.calculate();
                });
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  side: BorderSide(
                    width: 1.5,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
              child: Container(
                height: 48,
                alignment: Alignment.center,
                child: const AutoSizeText(
                  'CALCULAR',
                  presetFontSizes: [20, 16, 12],
                  maxLines: 1,
                  minFontSize: 12,
                  maxFontSize: 20,
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
