import 'package:bloc/bloc.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<AuthBlocEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LogInLoading());
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: event.email, password:event.password);
          emit(LogInSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LogInFailure(errMessage: 'user-not-found'));
          } else if (e.code == 'wrong-password') {
            emit(LogInFailure(errMessage: 'wrong-password'));
          }
        } on Exception catch (e) {
          emit(LogInFailure(
            errMessage: e.toString(),
          ));
        }
      }
    });
  }
}
