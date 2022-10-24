import 'package:Kanban/widgets/avatar-list/avatar_list.dart';
import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../home/home.dart';

class KanbanHome extends StatefulWidget {
  const KanbanHome({super.key});

  @override
  State<KanbanHome> createState() => _KanbanHomeState();
}

class _KanbanHomeState extends State<KanbanHome> {
  final groupNameEditController = TextEditingController();

  void fabAdd() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
                          child: Text("Enter your new group Name"),
                        ),
                      ],
                    ),
                    TextField(controller: groupNameEditController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              print(groupNameEditController.text);
                              groupStore.setGroup(groupNameEditController.text);
                              groupNameEditController.clear();
                              Navigator.pop(context);
                            },
                            child: const Text("Create group"))
                      ],
                    )
                  ],
                ),
              ));
        });
  }

  @override
  void initState() {
    super.initState();
  }

  List<Widget> getGroupsWidgets() {
    final settings = RestrictedAmountPositions(
      maxCoverage: 0.6,
      minCoverage: 0.4,
      align: StackAlign.left,
    );

    var test = groupStore.groups
        .map(
          (e) => ListTile(
            shape: const Border(bottom: BorderSide(width: 3)),
            key: Key(e.groupId),
            style: ListTileStyle.drawer,
            leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.album)]),
            title: Text(e.groupName),
            subtitle: Container(height: 30, child: AvatarList(group: e)),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              print(e.users);
            },
          ),
        )
        .toList();
    return test;
  }

  List<Widget> getAvatarList(List<String> users) {
    return users
        .map((user) => CircleAvatar(
            radius: 10, child: Image.network("https://i.pravatar.cc/150")))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Observer(
          builder: (BuildContext context) => CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(getGroupsWidgets()),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {fabAdd()},
          child: const Icon(Icons.add),
        ));
  }
}
