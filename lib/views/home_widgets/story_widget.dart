import 'package:flutter/material.dart';

class StoryWidget extends StatefulWidget {
  const new({super.key});

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  var stories = [
    "https://i.pravatar.cc/100?img=2",
    "https://i.pravatar.cc/100?img=3",
    "https://i.pravatar.cc/100?img=4",
    "https://i.pravatar.cc/100?img=5",
    "https://i.pravatar.cc/100?img=6",
    "https://i.pravatar.cc/100?img=7",
    "https://i.pravatar.cc/100?img=8",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) => StoryItemWidget(story: stories[index]),
      ),
    );
  }
}

class StoryItemWidget extends StatelessWidget {
  final String story;
  const new({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color:Colors.orangeAccent)),
      child: ClipOval(child: Image.network(story)),
    );
  }
}
