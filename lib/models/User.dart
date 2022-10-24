class UserModel {
  String userId;
  String nickName;

  UserModel(this.userId, this.nickName);

  static Object initUserInDb(String nickname) {
    return {'Nickname': nickname};
  }

  String getUserId() {
    return userId;
  }
}
