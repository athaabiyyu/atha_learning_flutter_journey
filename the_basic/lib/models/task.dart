class Task {
  String content;
  DateTime timeStamp;
  bool isDone;

  Task({
    required this.content,
    required this.timeStamp,
    this.isDone = false,
  });

  // ubah data ke bentuk map agar bisa disimpan di database
  Map<String, dynamic> toMap() {               // key string, dan value dynamis / bebas
    return {
      'content': content,
      'timeStamp': timeStamp.toString(), 
      'isDone': isDone,
    };
  }

  // ubah data dari bentuk map ke bentuk Object Task
  factory Task.fromMap(Map<String, dynamic> taskMap) {
    return Task(
      content: taskMap['content'],
      timeStamp: DateTime.parse(taskMap['timeStamp']),
      isDone: taskMap['isDone'],
    );
  }
}