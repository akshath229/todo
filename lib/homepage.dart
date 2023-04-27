import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/datastorage.dart';
import 'package:todo/taskidialogbox.dart';
import 'package:todo/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _tobox = Hive.box("todobox");
  ToDodata database = ToDodata();

  @override
  void initState() {

    if (_tobox.get("todolist")== null)
      {database.createinitialdata();
      }
    else
      {
      database.loaddata();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  final _controller2 = TextEditingController();


  // Checkbox changer
  void checkBox(bool? value, int index) {
    setState(() {
      database.toDoList[index][1] = !database.toDoList[index][1];
    });
    database.updatedatabase();
  }

  // Edit task
  void editTask(int index) {
    _controller.text = database.toDoList[index][0];
    _controller2.text = database.toDoList[index][2];
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          controller2: _controller2,
          save: () {
            setState(() {
              database.toDoList[index][0] = _controller.text;
              database.toDoList[index][2] = _controller2.text;

              _controller.clear();
              _controller2.clear();
              

              Navigator.of(context).pop();
            });
          },
          cancel: () {
            _controller.clear();
            _controller2.clear();

            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  // Save task
  void saveNewTask() {
    setState(() {
      database.toDoList.add([_controller.text, false,_controller2.text]);
      _controller.clear();
      _controller2.clear();
    });
    Navigator.of(context).pop();
    database.updatedatabase();
  }

  // Create task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          controller2: _controller2,
          save: saveNewTask,
          cancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Deleting
  void deleteTask(int index) {
    setState(() {
      database.toDoList.removeAt(index);
    });
    database.updatedatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            leading: Icon(Icons.menu),
            title: Text("T O D O L I S T"),
            actions: <Widget>[
              IconButton(padding: EdgeInsets.all(10),
              icon:  Icon(Icons.more_vert_outlined),
              onPressed: () {} ,
              ),
            ],
            pinned: true,
            expandedHeight: 200,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),

              )
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Todo(
                  taskName: database.toDoList[index][0],
                  taskCompleted: database.toDoList[index][1],
                  onchanged: (value) => checkBox(value, index),
                  deleteFunction: (context) => deleteTask(index),
                  editFunction: (context) => editTask(index),
                  description: database.toDoList[index][2]
                );
              },
              childCount: database.toDoList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.teal.shade300,
        child: Icon(Icons.add),
      ),
    );
  }
}
