import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/Group.dart';

class AvatarList extends StatefulWidget {
  final Group group;
  final int maxMembers;
  const AvatarList({Key? key, required this.group, this.maxMembers = 2}) : super(key: key);

  @override
  AvatarListState createState() => AvatarListState();
}

class AvatarListState extends State<AvatarList> {
  Widget mapGroupAsAvatars() {
    List<Widget> avatars = List.empty(growable: true);
    widget.group.users.asMap().forEach((i, value) {
      double decalage = i * 20;
      avatars.add(
        Positioned(
          left: decalage,
          child: ClipOval(
            child: Image.network("https://i.pravatar.cc/200", width: 30),
          ),
        ),
      );
    });

    return SizedBox(
        height: 50,
        width: 200,
        child:
            Stack(alignment: AlignmentDirectional.center, children: avatars));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [mapGroupAsAvatars()],
    );
  }
}
