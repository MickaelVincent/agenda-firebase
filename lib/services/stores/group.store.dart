import 'package:Kanban/models/Group.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

part 'group.store.g.dart';

// This is the class used by rest of your codebase
class GroupStore = _Group with _$GroupStore;

// The store-class
abstract class _Group with Store {
  CollectionReference groupsRef =
      FirebaseFirestore.instance.collection('groups');
  var currentUser = FirebaseAuth.instance.currentUser!.uid;

  @observable
  Group? currentGroup;

  @observable
  List<Group> groups = List.empty(growable: true);

  @action
  void refreshGroupListForCurrentUser() {
    List<Group> groupsTemp = List.empty();
    groupsRef
        .where("users", arrayContains: currentUser)
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      groupsTemp = snapshot.docs.map((DocumentSnapshot doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        List<dynamic> usersDyn = data["users"];
        final List<String> users = usersDyn.map((e) => e.toString()).toList();

        return Group.createGroupFromDocuments(users, data["Name"], doc.id);
      }).toList();
      groups = groupsTemp;
    });
  }

  @action
  Future<void> getGroup(String groupId) async {
    final snapshot =
        await FirebaseDatabase.instance.ref("groups/$groupId").get();
    //print(snapshot.value.toString());
  }

  @action
  Future<void> setGroup(String groupName) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    Group newGroup = Group.createGroup(userId, groupName);
    groupsRef.add(newGroup.toFirebaseObj());
  }
}
