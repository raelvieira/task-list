import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_tarefas/app/modules/home/components/list_card.dart';
import 'package:lista_tarefas/app/modules/home/create_tasks/create_tasks_module.dart';

class ListTaskPage extends StatefulWidget {
  @override
  _ListTaskPageState createState() => _ListTaskPageState();
}

class _ListTaskPageState extends State<ListTaskPage> {
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: () {
          Navigator.of(context).push(
              CupertinoPageRoute(builder: (context) => CreateTasksModule())
          );
        },
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 60, right: 20, bottom: 80, left: 60,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("My Task", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,),),
            Text("2 of 8 tasks"),
            Divider(
              height: 50,
            ),
            StreamBuilder<List>(
              stream: null,
              initialData: [1,2,3,4,5,6,7,8,9,10],
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),);
                }else if(snapshot.data.length == 0) {
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
                  return ListCard(
                    changeStatus: true,
                  );
                }
              }
            )
          ],
        ),
      )
    );
  }
}
