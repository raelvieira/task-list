import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final Stream<String> stream;
  final Function(String) onChanged;

  const TextInput({this.stream, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: this.stream,
      builder: (context, snapshot){
        return TextFormField(
          onChanged: this.onChanged,
          textCapitalization: TextCapitalization.words,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,),
          decoration: InputDecoration(
            hintText: "Type title here...",
            hintStyle: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color.fromARGB(90, 0, 0, 0)),
            border: InputBorder.none
          ),
        );
      },
    );
  }
}
