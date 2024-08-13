import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey[700],
          mainAxisAlignment: MainAxisAlignment.center,
          tabBackgroundColor: Colors.white,
          tabBorderRadius: 10,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
            GButton(
              icon: Icons.input,
              text: "Form",
            ),
            GButton(
              icon: Icons.task,
              text: "Task",
            )
          ]),
    );
  }
}
