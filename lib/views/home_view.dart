import 'package:campus_connect/views/home_widgets/appbar_widget.dart';
import 'package:campus_connect/views/home_widgets/post_widget.dart';
import 'package:campus_connect/views/home_widgets/story_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppbarWidget(),
        Expanded(
          child: Column(
            children: [StoryWidget(), Expanded(child: PostWidget())],
          ),
        ),
      ],
    );
  }
}
