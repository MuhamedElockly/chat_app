part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChatSuccess extends AuthState {
  List<MessageModel> messageList;
  ChatSuccess({required this.messageList});
}

final class ChatLoading extends AuthState {}

final class ChatFailure extends AuthState {}

final class LogInSuccess extends AuthState {}

final class LogInLoading extends AuthState {}

final class LogInFailure extends AuthState {
  String errMessage;
  LogInFailure({required this.errMessage});
}

final class RegisterSuccess extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  String errMessage;
  RegisterFailure({required this.errMessage});
}