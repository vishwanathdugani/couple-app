import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Couple App'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Chores'),
              Tab(text: 'Money'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Welcome to the Couple App')),
            Center(child: Text('Chores list goes here')),
            Center(child: Text('Money tracker goes here')),
          ],
        ),
      ),
    );
  }
}
