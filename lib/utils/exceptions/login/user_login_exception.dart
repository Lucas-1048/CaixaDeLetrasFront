class UserLoginException implements Exception {
  final String message;
  UserLoginException(this.message);
  @override
  String toString() {
    return message;
  }
}
