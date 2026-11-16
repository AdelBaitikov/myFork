import 'package:android_dev/screens/home_screen/models/story_model.dart';
import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel story;

  const StoryWidget({super.key, required this.story});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 76,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFFC107), Color(0xFFE1306C), Color(0xFF833AB4)],
                ),
              ),
              child: CircleAvatar(
                radius: 29,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(story.avatarUrl),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              story.authorName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
}
