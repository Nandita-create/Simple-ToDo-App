import 'package:flutter/material.dart';
import 'utils/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _controller = TextEditingController();
  List toDoList = [
    ['Learn App Development', false],
    ['Complete DS Assignment', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask(){
    setState((){
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index){
    setState((){
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,

        appBar: AppBar(
          title: const Text('Student ToDo App'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),

        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              onDelete: () => deleteTask(index),
            );
          },
        ),

        floatingActionButton: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a new to-do item and click + to add item to list',
                    filled: true,
                    fillColor: Colors.indigo.shade100,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.indigo,
                      ),
                          borderRadius: BorderRadius.circular(15),
                    ),
                  focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                color: Colors.indigo,
                ),
          borderRadius: BorderRadius.circular(15),
    ),
                  )
                ),
              ),
            ),
        FloatingActionButton(
            onPressed: saveNewTask,
        child: const Icon(Icons.add),
        ),
    ],
        ),
      ),
    );
  }
}