import 'package:bimal_poudel/local_database/sql_helper.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Map<String, dynamic>> _journals = [];

  void getJournals() async {
    final data = await SqlHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView.builder(
            itemCount: _journals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 80,
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _journals[index]['title'],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Row(
                            children: [
                              Text(
                                _journals[index]['description'],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[700]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.av_timer,
                                color: Colors.grey[600],
                              ),
                              Text(
                                _journals[index]['createdAt'],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          SqlHelper.deleteItem(_journals[index]['id']);
                          getJournals();
                        },
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(8), // Example of rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
