import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  }); // <-- 1. ADICIONADO PONTO E VÍRGULA

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isCompleted = task.isCompleted;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // <-- 2. CORRIGIDO "symmetric"
      child: ListTile( // <-- 3. CORRIGIDO "ListTile"
        leading: Checkbox(
          value: isCompleted, // <-- 4. ADICIONADA VÍRGULA
          onChanged: (_) => onToggle(),
        ),

        title: Text(
          task.title,
          style: textTheme.bodyLarge?.copyWith(
            decoration: isCompleted ? TextDecoration.lineThrough : null,
            color: isCompleted
                ? colorScheme.onSurface.withValues(alpha: 0.45)
                : colorScheme.onSurface,
          ),
        ),

        trailing: IconButton( // <-- 5. CORRIGIDO "trailing"
          tooltip: 'Excluir tarefa',
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline), // <-- 6. CORRIGIDO "Icons"
        ),
      ),
    );
  }
}
