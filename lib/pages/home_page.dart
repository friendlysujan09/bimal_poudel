import 'package:bimal_poudel/components/bottom_navbar.dart';
import 'package:bimal_poudel/pages/task_page.dart';
import 'package:bimal_poudel/pages/todo_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //variables
  int _currentBody = 1;

  List body_list = [TodoForm(), TaskPage()];

  //methods

  void navigateBody(index) {
    setState(() {
      _currentBody = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Colors.black,
          );
        }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TODO',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'App',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
      ),
      body: body_list[_currentBody],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: navigateBody,
      ),
    );
  }
}
