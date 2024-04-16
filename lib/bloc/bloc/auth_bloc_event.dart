part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

class LoginEvent extends AuthBlocBloc {
 final String email;
 final String passward;
  LoginEvent({required this.email, required this.passward});
}

class RegisterEvent extends AuthBlocBloc {}
