import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:lista_tarefas/app/modules/home/components/list_card.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(255, Random().nextInt(240), Random().nextInt(240), Random().nextInt(240)),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Task Title", style: TextStyle(color: Colors.white, fontSize: 18),),
              Divider(
                height: 50,
                color: Colors.white,
              ),
              StreamBuilder<List>(
                stream: null,
                initialData: [1,2,3,4,5,6],
                builder: (context, snapshot) {
                  if(!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)));
                  }else if(snapshot.data.length == 0) {
                    return Center(child: Text("No tasks here...", style: TextStyle(color: Colors.white, fontSize: 16),),);
                  }else {
                    return ListCard();
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
