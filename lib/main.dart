import 'package:flutter/material.dart';
import 'widgets/task_filter.dart'; // Mantido caso vá usar depois
import 'widgets/task_input.dart'; // <-- 1. IMPORTAÇÃO ADICIONADA (Ajuste o caminho se necessário)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Tarefas'),
        ),
        body: const Center(
          child: Text("Minhas tarefas aparecerão aqui!!"), // Corrigido erro de digitação "trefas"
        ),
        bottomNavigationBar: TaskInput(
          selectedDate: DateTime.now(),
          onAdd: (title, date) {
            debugPrint('tarefa: $title');
            debugPrint('Data: $date'); // <-- 2. CORRIGIDO DE "Date" PARA "date" (D minúsculo)
          },
        ), // <-- 3. ADICIONADA VÍRGULA DE FECHAMENTO DO CONSTRUTOR
      ),
    );   
  }
}
