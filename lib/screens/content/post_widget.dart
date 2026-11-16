import 'package:android_dev/screens/home_screen/models/post_model.dart';
import 'package:flutter/material.dart';
import 'comment_widget.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  final VoidCallback onLike;

  const PostWidget({super.key, required this.post, required this.onLike});

  void openComments(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.6,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Комментарии',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: post.comments.isEmpty
                    ? const Center(child: Text('Пока нет комментариев'))
                    : ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          for (final comment in post.comments)
                            CommentWidget(comment: comment),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(post.authorAvatarUrl),
              ),
              title: Text(
                post.authorName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              dense: true,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  post.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.broken_image_outlined, size: 48),
                  ),
                ),
              ),
            ),
            Row(children: [
              IconButton(
                icon: Icon(post.isLiked ? Icons.favorite : Icons.favorite_border),
                color: post.isLiked ? Colors.red : null,
                onPressed: onLike,
              ),
              Text('${post.likeCount}'),
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () => openComments(context),
              ),
              Text('${post.commentCount}'),
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
              const Spacer(),
              IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(post.description),
            ),
            if (post.comments.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CommentWidget(comment: post.comments.first),
              ),
          ],
        ),
      );
}
