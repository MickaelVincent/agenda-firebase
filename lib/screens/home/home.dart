import 'package:Kanban/screens/chat/chat.dart';
import 'package:Kanban/screens/kanban-landing/kanban_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/stores/group.store.dart';

final groupStore = GroupStore();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    groupStore.refreshGroupListForCurrentUser();
    super.initState();
  }

  Widget getIconForPage(int index) {
    switch (index) {
      case 0:
        return (_selectedIndex == index)
            ? const Icon(Icons.view_kanban)
            : const Icon(Icons.view_kanban_outlined);

      case 1:
        return (_selectedIndex == index)
            ? const Icon(Icons.chat_bubble)
            : const Icon(Icons.chat_bubble_outline);
      default:
        return const Icon(Icons.error);
    }
  }

  void disconnect() async {
    await FirebaseAuth.instance
        .signOut()
        .onError((error, stackTrace) => print(error));
  }

  static const List<Widget> _widgetOptions = <Widget>[KanbanHome(), ChatPage()];
  static const List<String> _widgetName = <String>['Kanbans', 'Chat'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_widgetName.elementAt(_selectedIndex)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (() {
                disconnect();
              }),
              icon: const Icon(Icons.power_settings_new_outlined))
        ],
      ),
      body:  Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: getIconForPage(0), label: _widgetName.elementAt(0)),
          BottomNavigationBarItem(
              icon: getIconForPage(1), label: _widgetName.elementAt(1)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
