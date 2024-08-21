import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  @override

  List<Object?> get props => [message,statusCode];
}

class ApiFailure extends Failure {
 ApiFailure({required String message, required int statusCode}) : super(message: message, statusCode: statusCode);


}