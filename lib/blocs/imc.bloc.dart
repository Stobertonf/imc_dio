import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class ImcBloc {
  var weigthCtrl = MaskedTextController(mask: '000');
  var heightCtrl = MaskedTextController(mask: '000');
  var result = "Verifique se todos os campos foram preenchidos";

  calculate() {
    var weightCtrl;
    double weight = double.parse(weightCtrl.text);
    double height = double.parse(heightCtrl.text) / 100;
    double imc = weight / (height * height);

    if (imc < 18.6) {
      result =
          "Abaixo do Peso (Coma um poquinho a mais)(${imc.toStringAsPrecision(2)})";
    } else if (imc >= 18.6 && imc <= 24.9) {
      result = "Peso Ideal (Parabéns!!!) (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc <= 29.9) {
      result =
          "Levemente acima do peso (Cuidado, caminhada e esteira vão te ajudar) (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 24.9 && imc <= 34.9) {
      result =
          "Obesidade Grau I (Vai pra academia) (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 34.9 && imc <= 39.9) {
      result =
          "Obesidade Grau II (Larga a pizza) (${imc.toStringAsPrecision(2)})";
    } else if (imc >= 40) {
      result =
          "Obesidade Grau III (Pelo amor de Deus, para de mastigar!!!) (${imc.toStringAsPrecision(2)})";
    }
  }
}
