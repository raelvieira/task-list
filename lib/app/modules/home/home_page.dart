import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lista_tarefas/app/models/Tasks.dart';
import 'package:lista_tarefas/app/modules/home/components/card_list.dart';
import 'package:lista_tarefas/app/modules/home/create_tasks/create_tasks_module.dart';
import 'package:lista_tarefas/app/modules/home/home_bloc.dart';
import 'package:lista_tarefas/app/modules/home/home_module.dart';

import 'list_task/list_task_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc = HomeModule.to.getBloc<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    _homeBloc.getTasks();

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("images/logo.png"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 10), child: Divider(height: 1, color: Colors.black,))),
                Text("Tasks", style: TextStyle(fontSize: 35, color: Colors.grey[700], fontWeight: FontWeight.bold),),
                Text("List", style: TextStyle(fontSize: 35, color: Colors.grey[400]),),
                Expanded(child: Container(margin: const EdgeInsets.symmetric(horizontal: 10), child: Divider(height: 1, color: Colors.black,))),
              ],
            ),
            GestureDetector(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey[300]
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(4))
                    ),
                    child: Icon(Icons.add, color: Colors.grey[700],)
                  ),
                  Text("Add List", style: TextStyle(color: Colors.grey[700], fontSize: 16),)
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => CreateTasksModule())
                );
              },
            ),
            StreamBuilder<List<Tasks>>(
              stream: _homeBloc.outTasks,
              builder: (context, snapshot) {
                if(!snapshot.hasData) {
                  return Center(heightFactor: 5, child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),);
                }else if(snapshot.data.length == 0) {
                  return Center(
                    heightFactor: 5,
                    child: Text("Nenhuma tarefa encontrada!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),),
                  );
                }else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: snapshot.data.map((item) => GestureDetector(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.9,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: CardList()
                      ),
                      onTap: (){
                        Navigator.of(context).push(
                          CupertinoPageRoute(builder: (context) => ListTaskModule())
                        );
                      },
                    )).toList()),
                  );
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
