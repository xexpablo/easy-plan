import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Não tem uma conta ? " : "Já tem um conta ? ",
          style: TextStyle(color: kPrimaryLetterColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Cadastre-se" : "Acesse",
            style: TextStyle(
              color: kPrimaryLetterColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
