class ServerErroException implements Exception {
  final String message;
  ServerErroException(this.message);
  @override
  String toString() {
    return message;
  }
}
