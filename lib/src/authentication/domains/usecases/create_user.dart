import 'package:equatable/equatable.dart';
import 'package:tdd_tutorial/core/usecase/usecase.dart';
import 'package:tdd_tutorial/src/authentication/domains/repositories/auth_repo.dart';

import '../../../../core/utils/typedef.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserWithParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;


  @override
  ResultFuture call(CreateUserWithParams params) async =>
      _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}
class CreateUserWithParams extends Equatable{
  const CreateUserWithParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
});

  const CreateUserWithParams.empty()
    :this(
    createdAt: '_empty.createAt',
    name: '_empty.name',
    avatar: '_empty.avatar',
  );

  final String createdAt;
  final String name;
  final String avatar;
  @override
  List<Object?> get props => [createdAt,name,avatar];

}