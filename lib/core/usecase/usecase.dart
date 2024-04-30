import 'package:dartz/dartz.dart';

abstract interface class BasicUseCase<SuccessType, Params> {
  SuccessType call(Params params);
}

abstract interface class BasicUseCaseNoParams<SuccessType> {
  SuccessType call();
}

abstract interface class UseCase<SuccessType, Params> {
  Either<Exception, SuccessType> call(Params params);
}

abstract interface class UseCaseNoParams<SuccessType> {
  Either<Exception, SuccessType> call();
}

abstract interface class FutureUseCase<SuccessType, Params> {
  Future<Either<Exception, SuccessType>> call(Params params);
}

abstract interface class FutureUseCaseNoParams<SuccessType> {
  Future<Either<Exception, SuccessType>> call();
}
