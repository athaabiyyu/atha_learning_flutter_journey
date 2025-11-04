class Task {
  String content;
  DateTime timestamp;
  bool done;

  Task({
    required this.content,
    required this.timestamp,
    required this.done,
  });

  // ubah object menjadi Map (key - value) agar bisa disimpan di hive
  Map<String, dynamic> toMap() {
    return {
      'content' : content,
      'timestamp' : timestamp.toString(),
      'done' : done,
    };
  }

  // ubah dari key-value menjadi object lagi agar bisa dipakai di UI
  factory Task.fromMap(Map<String, dynamic> taskMap) {
    return Task (
      content: taskMap['content'],
      timestamp: DateTime.parse(taskMap['timestamp']),
      done: taskMap['done'],
    );
  }
}

