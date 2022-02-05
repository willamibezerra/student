import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:state/repositories/student_repository.dart';
import 'package:state/student_state.dart';

class StudentStateNotfier extends StateNotifier<StudentState> {
  final StudantStateRepository repository;
  StudentStateNotfier({required this.repository}) : super(Initial());

  Future<void> getDados() async {
    state = Loading();
    bool result = await repository.getRepository();
    if (result) {
      state = Sucess();
    } else if (!result) {
      state = Failure();
    }
  }
}
