import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state/provider.dart';
import 'package:state/student_state.dart';

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController notaController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(studentStateProvider);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 100, right: 100),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 100, right: 100),
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
          buildStudentState(state),
          buildNotaAtual(
            nome: "clicar",
            onTap: () {
              ref.read(studentStateProvider.notifier).getDados();
            },
          ),
        ],
      ),
    );
  }

  Widget buildNotaAtual(
      {required String nome, required Function()? onTap, required}) {
    return Column(
      children: [
        const SizedBox(height: 4),
        ElevatedButton(onPressed: onTap, child: const Text("clicar"))
      ],
    );
  }

  Widget buildStudentState(StudentState state) {
    if (state is Loading) {
      return const CircularProgressIndicator();
    } else if (state is Sucess) {
      return const Text("sucesso");
    } else if (state is Failure) {
      return const Text("erro");
    } else {
      return Container();
    }
  }
}
