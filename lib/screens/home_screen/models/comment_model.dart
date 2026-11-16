class CommentModel {
  final String id;
  final String authorName;
  final String authorAvatarUrl;
  final String text;

  const CommentModel({
    required this.id,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.text,
  });
}
