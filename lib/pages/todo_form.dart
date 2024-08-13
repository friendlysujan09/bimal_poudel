import 'package:bimal_poudel/local_database/sql_helper.dart';
import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  //defining controller for textfield
  final title_controller = TextEditingController();
  final desc_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: title_controller,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: desc_controller,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String title = title_controller.text;
                      String description = desc_controller.text;
                      print(title + description);
                      title_controller.clear();
                      desc_controller.clear();
                      FocusScope.of(context).unfocus();
                      SqlHelper.createItem(title, description);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.grey[900]),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
