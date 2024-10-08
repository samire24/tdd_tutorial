import 'package:dartz/dartz.dart';
import 'package:tdd_tutorial/core/errors/failures.dart';
import 'package:tdd_tutorial/src/authentication/domains/entities/user.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;