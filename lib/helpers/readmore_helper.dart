import 'package:flutter/material.dart';

class ReadmoreHelper extends StatefulWidget {
  final String text;
  const new(this.text, {super.key});

  @override
  State<ReadmoreHelper> createState() => _ReadmoreHelperState();
}

class _ReadmoreHelperState extends State<ReadmoreHelper> {
  var maxLength = 200;
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var text = widget.text;
    var isLong = text.length > maxLength;

    var displayedText = isExpanded || !isLong
        ? text
        : "${text.substring(0, 200)}...";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(displayedText),

        if (isLong)
          GestureDetector(
            onTap: () => setState(() {
              isExpanded = !isExpanded;
            }),
            child: Text(isExpanded ? "Read less" : "Read more",style: TextStyle(color: Colors.blue),),
          ),
      ],
    );
  }
}
