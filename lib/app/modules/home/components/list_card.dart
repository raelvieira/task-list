import 'package:flutter/material.dart';

class ListCard extends StatefulWidget {
  bool changeStatus;

  ListCard({this.changeStatus = false});

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  List task = [
    {"name": "Task Task Task", "completed": false},
    {"name": "Task Task Task", "completed": true},
    {"name": "Task Task Task", "completed": false},
    {"name": "Task Task Task", "completed": false},
    {"name": "Task Task Task", "completed": false},
    {"name": "Task Task Task", "completed": false},
    {"name": "Task Task Task", "completed": false},
    {"name": "Task Task Task", "completed": false},

  ];

  _alteraStatus(int item) {
    task[item]["completed"] = !task[item]["completed"];
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: task.length,
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => widget.changeStatus ? _alteraStatus(index) : null,
            child: Container(margin: const EdgeInsets.only(bottom: 20), child: _retornaTarefa(task[index]))
          );
        },
      ),
    );
  }

  Widget _retornaTarefa(Map task) {
    if(task["completed"]) {
      return Text(
        task["name"],
        style: TextStyle(
          color: widget.changeStatus ? Colors.redAccent : Colors.white,
          fontSize: widget.changeStatus ? 20 : 15,
          fontWeight: widget.changeStatus ? FontWeight.bold : FontWeight.normal,
          decoration: TextDecoration.lineThrough,
        ),
      );
    }

    return Text(
      task["name"],
      style: TextStyle(
        color: widget.changeStatus ? Colors.black : Colors.white,
        fontSize: widget.changeStatus ? 20 : 15,
        fontWeight: widget.changeStatus ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
