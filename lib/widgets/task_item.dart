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
    })

    @override
    Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
        final textTheme = Theme.of(context).textTheme;
        final isCompleted = task.isCompleted;

        return Card(
            margin: const EdgeInsets.symetric(horizontal: 16, vertical: 6),
            child: ListTitle(
                leading: Checkbox(
                    value: isCompleted
                    onChanged: (_) => onToggle(),
                ), //CheckBox

                title: Text(
                    task.title,
                    style: textTheme.bodyLarge?.copyWith(
                        decoration: isCompleted ?
                        TextDecoration.lineThrough :
                        null,
                        color: isCompleted ?
                        colorScheme.onSurface.withValues(alpha: 0.45) :
                        colorScheme.onSurface,
                    ),
                ), //Text

                tralling: IconButton(
                    tooltip: 'Excluir tarefa',
                    onPressed: onDelete,
                    icon: const Icon(Icon.delete_outline),
                ), //IconButton
            ), //ListTile
        ); // Card
    }
}