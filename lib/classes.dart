import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoForm extends StatefulWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  bool isPassword;
  bool isVisible;
  final bool isEmail;
  bool justRead = false;

  CampoForm({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
    this.isVisible = false,
    this.justRead = false,
  });

  @override
  _CampoFormState createState() => _CampoFormState();
}

class _CampoFormState extends State<CampoForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(
          decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: EdgeInsets.all(15),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[300],
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        widget.isVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.deepOrangeAccent,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.isVisible = !widget.isVisible;
                          //widget.isPassword = !widget.isPassword;
                        });
                      },
                    )
                  : null),
          readOnly: widget.justRead,
          obscureText: widget.isVisible ? true : false,
          validator: widget.validator,
          onSaved: widget.onSaved,
          keyboardType:
              widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        ),
      ),
    );
  }
}

class Botoes extends StatelessWidget {
  final String text;
  final double width;
  final Function onPressed;
  Botoes([
    this.text,
    this.width,
    this.onPressed,
  ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        width: width,
        height: 40,
        child: ElevatedButton(
          child: Text(text),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
