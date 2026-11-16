import 'comment_model.dart';

class PostModel {
  final String id;
  final String imageUrl;
  final int likeCount;
  final String description;
  final String authorId;
  final String authorName;
  final String authorAvatarUrl;
  final List<CommentModel> comments;
  final bool isLiked;

  const PostModel({
    required this.id,
    required this.imageUrl,
    required this.description,
    required this.authorId,
    required this.authorName,
    required this.authorAvatarUrl,
    this.comments = const [],
    this.likeCount = 0,
    this.isLiked = false,
  });

  int get commentCount => comments.length;

  PostModel copyWith({int? likeCount, bool? isLiked}) => PostModel(
        id: id,
        imageUrl: imageUrl,
        description: description,
        authorId: authorId,
        authorName: authorName,
        authorAvatarUrl: authorAvatarUrl,
        comments: comments,
        likeCount: likeCount ?? this.likeCount,
        isLiked: isLiked ?? this.isLiked,
      );
}
