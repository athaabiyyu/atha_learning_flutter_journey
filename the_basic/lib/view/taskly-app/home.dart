import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:the_basic/models/task.dart';

class TasklyHome extends StatefulWidget {
  TasklyHome({super.key});

  @override
  State<TasklyHome> createState() => _TasklyHomeState();
}

class _TasklyHomeState extends State<TasklyHome> {

  Box? _box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taksly Home'),
      ),
      body: _showList(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _taksList() {
    Task new_taks = Task(content: "Pray", timestamp: DateTime.now(), done: false);
    _box?.add(new_taks.toMap());
    return ListView(
      children: [
        ListTile(
          title: const Text(
            "Do Laundry",
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Colors.red,
          ),
        ),
        ListTile(
          title: const Text(
            "Do Breakfast",
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          subtitle: Text(
            DateTime.now().toString(),
          ),
          trailing: const Icon(
            Icons.check_box_outlined,
            color: Colors.red,
          ),
        )
      ],
    );
  }

  Widget _showList() {
    return FutureBuilder(
      future: Hive.openBox('tasks'), 
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _box = snapshot.data;
          return _taksList();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        _dialogAddTask();
      },
      child: const Icon(Icons.add),
    );
  }

  void _dialogAddTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Add New Task !"),
            content: TextField(
              onChanged: (value) {
                if (kDebugMode) {
                  print("User mengetik: $value");
                }
              },
            ),
          );
        });
  }
}
