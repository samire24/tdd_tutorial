
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_tutorial/src/authentication/data/models/user_model.dart';
import 'package:tdd_tutorial/src/authentication/domains/entities/user.dart';

void main(){

  test('should be a Subclass of [User] identity', (){
    //Arrange
    const tModel = UserModel.empty();
    // Act

    //assert
    expect(tModel, isA<User>());
  });
}