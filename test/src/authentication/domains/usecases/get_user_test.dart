import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_tutorial/src/authentication/domains/entities/user.dart';
import 'package:tdd_tutorial/src/authentication/domains/repositories/auth_repo.dart';
import 'package:tdd_tutorial/src/authentication/domains/usecases/get_user.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers useCases;

  setUp(() {
    repository = MockAuthRepo();
    useCases = GetUsers(repository);
  });
  const tResponse = [User.empty()];

  test('Should call [AuthRepo.getUser] and return [List<User>]',
      () async {
    //Arrange
        //STUB
        when(() => repository.getUsers()).thenAnswer(
                (_) async => const Right(tResponse));

        //Action
        final result =await useCases();
        expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
        verify(()=> repository.getUsers()).called(1);
        verifyNoMoreInteractions(repository);
      }
      
  );
}