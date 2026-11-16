import 'package:android_dev/screens/home_screen/models/post_model.dart';

class PostServices {
  final List<PostModel> _posts = [];

  void addPost(PostModel post) {
    _posts.add(post);
  }

  void batchAddPosts(List<PostModel> newPosts) {
    _posts.addAll(newPosts);
  }

  List<PostModel> getPosts() => List.unmodifiable(_posts);

  void updatePost(PostModel updatedPost) {
    final index = _posts.indexWhere((post) => post.id == updatedPost.id);
    if (index == -1) {
      throw StateError('Post ${updatedPost.id} was not found.');
    }
    _posts[index] = updatedPost;
  }
}