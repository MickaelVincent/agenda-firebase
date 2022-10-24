// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupStore on _Group, Store {
  late final _$currentGroupAtom =
      Atom(name: '_Group.currentGroup', context: context);

  @override
  Group? get currentGroup {
    _$currentGroupAtom.reportRead();
    return super.currentGroup;
  }

  @override
  set currentGroup(Group? value) {
    _$currentGroupAtom.reportWrite(value, super.currentGroup, () {
      super.currentGroup = value;
    });
  }

  late final _$groupsAtom = Atom(name: '_Group.groups', context: context);

  @override
  List<Group> get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(List<Group> value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

  late final _$getGroupAsyncAction =
      AsyncAction('_Group.getGroup', context: context);

  @override
  Future<void> getGroup(String groupId) {
    return _$getGroupAsyncAction.run(() => super.getGroup(groupId));
  }

  late final _$setGroupAsyncAction =
      AsyncAction('_Group.setGroup', context: context);

  @override
  Future<void> setGroup(String groupName) {
    return _$setGroupAsyncAction.run(() => super.setGroup(groupName));
  }

  late final _$_GroupActionController =
      ActionController(name: '_Group', context: context);

  @override
  void refreshGroupListForCurrentUser() {
    final _$actionInfo = _$_GroupActionController.startAction(
        name: '_Group.refreshGroupListForCurrentUser');
    try {
      return super.refreshGroupListForCurrentUser();
    } finally {
      _$_GroupActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentGroup: ${currentGroup},
groups: ${groups}
    ''';
  }
}
