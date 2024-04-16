part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {}

final class ChatSuccess extends AuthBlocState {
  List<MessageModel> messageList;
  ChatSuccess({required this.messageList});
}

final class LogInSuccess extends AuthBlocState {}

final class LogInLoading extends AuthBlocState {}

final class LogInFailure extends AuthBlocState {
  String errMessage;
  LogInFailure({required this.errMessage});
}

final class RegisterSuccess extends AuthBlocState {}

final class RegisterLoading extends AuthBlocState {}


final class RegisterFailure extends AuthBlocState {
  String errMessage;
  RegisterFailure({required this.errMessage});
}