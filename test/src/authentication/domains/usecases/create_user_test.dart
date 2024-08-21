
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domains/repositories/auth_repo.dart';
import 'package:tdd_tutorial/src/authentication/domains/usecases/create_user.dart';

import 'authentication_repository.mock.dart';
// 1. what does the class depends on
//Answer -- depends on AuthenticationRepository


void main() {
  late CreateUser useCase;
  late AuthenticationRepository repository;
//2. how can we create the fake version of the dependency
// Answer -- we use Mocktail (Mock)
  setUp(() {
    repository = MockAuthRepo();
    useCase = CreateUser(repository);
  });

  const params = CreateUserWithParams.empty();
  test('Should call the [AuthRepo.createUser]',
          () async {
        //Arrange
        //STUB
            // 3. how do we control what our dependencies do
//Answer -- using the Mocktail API's
        when(
              () =>
              repository.createUser(
                createdAt: any(named: 'createAt'),
                name: any(named: 'name'),
                avatar: any(named: 'avatar'),),
        ).thenAnswer((_) async => Right(null));
        //Action
        final result = await useCase(params);
        //Assert
        expect(result, equals(const Right<dynamic, void>(null)));
        verify(
                () =>
                repository.createUser(
                    createdAt: params.createdAt,
                    name: params.name,
                    avatar: params.avatar),
        ).called(1);
        verifyNoMoreInteractions(repository);
      }
  );
}




