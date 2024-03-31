import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
 FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  void sendMessage({required String message}) async{
      messages.add(
                        {
                          'message': message,
                          'createdAt': DateTime.now(),
                          'userId': user?.uid
                        },
                      );

  }
}
