import 'package:flutter/material.dart';
import 'package:todo/savebutton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final controller2;

  VoidCallback save;
  VoidCallback cancel;

  DialogBox({super.key,
    required this.controller,
    required this.save,
    required this.cancel,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      backgroundColor: Colors.white, shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)),
      content: Container(
        height: 254,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


          //user input

            // title
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                hintText: "Title",
              ),
          ),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  hintText: "Description",
                ),
              ),
            ),


              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                //save button

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Mybutton(onPressed: save, text: 'Save'),
                ),


                //cancel buton

                  Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Mybutton(onPressed: cancel, text: 'Cancel'),
                )
              ],
              ),
        ],
        ),
      ),
    );
  }
}
