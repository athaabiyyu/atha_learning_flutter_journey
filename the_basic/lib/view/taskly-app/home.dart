import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TasklyHome extends StatefulWidget {
  @override
  State<TasklyHome> createState() => _TasklyHomeState();
}

class _TasklyHomeState extends State<TasklyHome> {

  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Widget build(BuildContext context) {

    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Taskly',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
        toolbarHeight: _deviceHeight * 0.15,
      ),
      body: _taskView(),
      floatingActionButton: addTaskButton(),
    );
  }

  Widget _taskView() {
    return FutureBuilder(
      //future: Hive.openBox('tasks'),
      future: Hive.openBox('tasks'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData) {
          return _listView();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  Widget _listView() {
    return ListView(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.01)),
        ListTile(
          title: const Text('Task 1', style: TextStyle(fontSize: 20),),
          subtitle: Text(DateTime.now().toString(), style: const TextStyle(fontSize: 15)),
          trailing: const Icon(Icons.check_box_outlined, color: Colors.red,),
        ),
        ListTile(
          title: const Text('Task 2s', style: TextStyle(fontSize: 20),),
          subtitle: Text(DateTime.now().toString(), style: const TextStyle(fontSize: 15)),
          trailing: const Icon(Icons.check_box_outlined, color: Colors.red,),
        ),
      ],
    );
  }

  Widget addTaskButton() {
    return FloatingActionButton(
      onPressed: _displatTaskPopUp,
      backgroundColor: Colors.red,
      child: const Icon(Icons.add, size: 40,),
    );
  }

  void _displatTaskPopUp() {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Task!'),
          content: TextField(
            onSubmitted: (_value) {},
            onChanged: (_value) {},
          ),
        );
      },
    );
  }
}