import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/demo_posts.dart';
import '../models/post_model.dart';
import '../services/post_services.dart';

final postServicesProvider = Provider<PostServices>((ref) {
  final service = PostServices()..batchAddPosts(demoPosts);
  return service;
});

class FeedController extends Notifier<List<PostModel>> {
  @override
  List<PostModel> build() => ref.watch(postServicesProvider).getPosts();

  void toggleLike(String id) {
    final service = ref.read(postServicesProvider);
    final post = state.firstWhere((post) => post.id == id);
    service.updatePost(
      post.copyWith(
        isLiked: !post.isLiked,
        likeCount: post.likeCount + (post.isLiked ? -1 : 1),
      ),
    );
    state = service.getPosts();
  }
}

final feedControllerProvider =
    NotifierProvider<FeedController, List<PostModel>>(FeedController.new);
