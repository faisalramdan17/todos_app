import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:todos_app/core/error/exceptions.dart';

abstract interface class ErrorHandler {
  Future<Either<Exception, T>> guard<T>(Future<T> Function() fn);
}

class ErrorHandlerImpl implements ErrorHandler {
  @override
  Future<Either<Exception, T>> guard<T>(Future<T> Function() fn) async {
    try {
      return right(await fn());
    } on Exception catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      return left(e);
    } catch (e, s) {
      final error = UnhandledException(e.toString(), s);
      log(error.toString(), error: e, stackTrace: s);
      return left(error);
    }
  }
}
