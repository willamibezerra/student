import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/repositories/student_repository.dart';

import 'package:state/student_state.dart';
import 'package:state/student_state_notfier.dart';

import 'package:riverpod/riverpod.dart';

final studentStateRepository = Provider((ref) => StudantStateRepository());
final studentStateProvider =
    StateNotifierProvider<StudentStateNotfier, StudentState>((ref) =>
        StudentStateNotfier(repository: ref.read(studentStateRepository)));
