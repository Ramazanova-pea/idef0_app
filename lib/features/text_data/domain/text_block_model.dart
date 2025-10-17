class TextBlockModel {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime updatedAt;

  const TextBlockModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.updatedAt,
  });

  TextBlockModel copyWith({
    String? title,
    String? content,
  }) {
    return TextBlockModel(
      id: id,
      userId: userId,
      title: title ?? this.title,
      content: content ?? this.content,
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'content': content,
    'updatedAt': updatedAt.toIso8601String(),
  };

  factory TextBlockModel.fromJson(Map<String, dynamic> json) {
    return TextBlockModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      content: json['content'],
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
