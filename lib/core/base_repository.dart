import 'package:car_store/core/result.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Result<BaseError, Entity>
  execute<Model extends BaseModel<Entity>, Entity extends BaseEntity>({
    required Either<BaseError, Model> remoteResult,
  }) {
    if (remoteResult.isRight()) {
      return Result(
        data: (remoteResult as Right<BaseError, Model>).value.toEntity(),
      );
    } else {
      return Result(
        error: (remoteResult as Left<BaseError, Model>).value,
      );
    }
  }



  Result<BaseError, List<T>>
  executeWithList<Model extends BaseModel<T>, T extends BaseEntity>({
    required Either<BaseError, List<Model>> remoteResult,
  }) {
    if (remoteResult.isRight()) {
      return Result(
        data: (remoteResult as Right<BaseError, List<Model>>)
            .value
            .map((e) => e.toEntity())
            .toList(),
      );
    } else {
      return Result(
        error: (remoteResult as Left<BaseError, List<Model>>).value,
      );
    }
  }

  Result<BaseError, Model> executeWithoutConvert<Model, Entity>({
    required Either<BaseError, Model> remoteResult,
  }) {
    if (remoteResult.isRight()) {
      return Result(
        data: (remoteResult as Right<BaseError, Model>).value,
      );
    } else {
      return Result(error: (remoteResult as Left<BaseError, Model>).value);
    }
  }
}


abstract class BaseModel<T extends BaseEntity> {
  T toEntity();
}


abstract class BaseEntity extends Equatable{


  const BaseEntity();
}
