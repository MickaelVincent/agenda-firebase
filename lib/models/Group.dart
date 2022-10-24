import 'package:uuid/uuid.dart';

class Group {
  String groupId;
  String groupName;
  List<String> users;

  Group.createGroup(String userId, this.groupName): users =[userId], groupId = const Uuid().v4();

  Group.createGroupFromDocuments(this.users, this.groupName, this.groupId);

  void addGroupMember(List<String> newMembers){
    users.addAll(newMembers);
  }

  Object toFirebaseObj(){
    return {
      'Name': groupName,
      'users': users
    };
  }

}
