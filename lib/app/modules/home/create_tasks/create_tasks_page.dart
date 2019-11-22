import 'package:flutter/material.dart';
import 'package:lista_tarefas/app/modules/home/create_tasks/components/floating_button.dart';

import 'components/text_input.dart';

class CreateTasksPage extends StatefulWidget {
  @override
  _CreateTasksPageState createState() => _CreateTasksPageState();
}

class _CreateTasksPageState extends State<CreateTasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("images/logo.png"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear, size: 35, color: Colors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      floatingActionButton: FloatingButton(
        stream: null,
        child: Text("OK"),
        onPressed: (){ },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 60, right: 20, bottom: 80, left: 60,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextInput(),
              Text("0 of 0 tasks"),
              Divider(
                height: 50,
              ),
              StreamBuilder(
                stream: null,
                builder: (context, snapshot) {
                  if(!snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("No tasks here...", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text("Tap add button to create task", style: TextStyle(fontSize: 17, color: Colors.grey[700], letterSpacing: .2),)
                        ],
                      ),
                    );
                  }else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
