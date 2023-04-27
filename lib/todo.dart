import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todo extends StatelessWidget {

  final String taskName;
  final String description;
  final bool taskCompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;


  Todo({super.key, required this.taskName,
     required this.taskCompleted,
     required this.onchanged,
     required this.deleteFunction,
    required this.editFunction,
     required this.description,
   });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: editFunction,
              icon: Icons.edit,
              backgroundColor: Colors.deepOrange.shade100,
              borderRadius: BorderRadius.circular(20),),
            SlidableAction(onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.deepOrange.shade300,
            borderRadius: BorderRadius.circular(20)),

          ],
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Checkbox(value: taskCompleted, onChanged:onchanged ,activeColor: Colors.yellow),

              Text(taskName,style: TextStyle(fontFamily: "Trajan Pro",fontSize: 32,
                decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none,
              ),
              ),
                ],
              ),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: SizedBox(height: 6,width: 20),
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                    decoration: taskCompleted ? TextDecoration.lineThrough: TextDecoration.none,
              ),
              ),],
          ),
          decoration: BoxDecoration(//shape: BoxShape.rectangle,
            color: Colors.teal.shade500,borderRadius: BorderRadius.circular(32)
          ),
        ),
      ),
    );
  }
}
