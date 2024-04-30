class NoInternetException implements Exception {
  final String message = 'Not connected to a network!';
  const NoInternetException();

  @override
  String toString() => "NoInternetException: $message";

  @override
  bool operator ==(Object other) => other is NoInternetException && other.message == message;

  @override
  int get hashCode => message.hashCode;
}

class UnhandledException implements Exception {
  final String message;
  final StackTrace stackTrace;

  const UnhandledException(this.message, this.stackTrace);

  @override
  String toString() {
    return 'Sorry, we have an unhandled exception. Please try again later!';
  }

  @override
  bool operator ==(Object other) => other is UnhandledException && other.message == message;

  @override
  int get hashCode => message.hashCode;
}

class ServerException implements Exception {
  final String message;
  const ServerException(this.message);

  @override
  String toString() {
    return 'ServerException: $message';
  }

  @override
  bool operator ==(Object other) => other is ServerException && other.message == message;

  @override
  int get hashCode => message.hashCode;
}

class LocalServerException implements Exception {
  final String? message;
  const LocalServerException([this.message]);

  @override
  String toString() {
    return 'LocalServerException: $message';
  }

  @override
  bool operator ==(Object other) => other is ServerException && other.message == message;

  @override
  int get hashCode => message.hashCode;
}
