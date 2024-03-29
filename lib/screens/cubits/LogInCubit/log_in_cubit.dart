import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInInitial());

  Future<void> logInUser(
      {required String email, required String password}) async {
    emit(LogInLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
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
}
