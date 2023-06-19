import 'package:movies_app/core/network/errior_msg_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel ;

  ServerException({required this.errorMessageModel});

}