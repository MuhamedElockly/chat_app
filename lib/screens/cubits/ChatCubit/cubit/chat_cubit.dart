import 'package:bloc/bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
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
  void sendMessage({required String message}) async {
    //emit(ChatLoading());
    messages.add(
       {'message': message, 'createdAt': DateTime.now(), 'userId': user?.uid},
    );
  }

  void getMessages() {
    List<MessageModel> messagesList = [];
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(messageList: messagesList));
    });
  }
}
