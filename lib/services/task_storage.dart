class Task {
  final String title;
  final bool isCompleted;
  final DateTime date;

  Task({
    required this.title,
    this.isCompleted = false,
    required this.date,
  });

  // 1. Este método precisa existir para o TaskStorage.loadTasks() funcionar:
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool,
      date: DateTime.parse(json['date'] as String),
    );
  }

  // 2. Este método precisa existir para o TaskStorage.saveTasks() funcionar:
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'date': date.toIso8601String(),
    };
  }
}
