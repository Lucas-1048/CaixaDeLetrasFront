class UnKonwError implements Exception {
  final String message;
  UnKonwError(this.message);
  @override
  String toString() {
    return message;
  }
}
