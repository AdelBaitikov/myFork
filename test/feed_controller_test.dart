import 'package:android_dev/screens/home_screen/data/demo_posts.dart';
import 'package:android_dev/screens/home_screen/services/post_services.dart';
import 'package:android_dev/screens/home_screen/state/feed_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('demo feed contains 20 unique posts with individual comments', () {
    expect(demoPosts, hasLength(20));
    expect(demoPosts.map((post) => post.id).toSet(), hasLength(20));
    expect(demoPosts.every((post) => post.comments.isNotEmpty), isTrue);
    expect(
      demoPosts.map((post) => post.comments.first.text).toSet(),
      hasLength(20),
    );
  });

  test('feed controller gets and updates posts through its injected service',
      () {
    final service = PostServices()..batchAddPosts([demoPosts.first]);
    final container = ProviderContainer(
      overrides: [postServicesProvider.overrideWithValue(service)],
    );
    addTearDown(container.dispose);

    final controller = container.read(feedControllerProvider.notifier);
    expect(container.read(feedControllerProvider), hasLength(1));

    controller.toggleLike(demoPosts.first.id);

    expect(container.read(feedControllerProvider).single.isLiked, isTrue);
    expect(service.getPosts().single.isLiked, isTrue);
  });
}
