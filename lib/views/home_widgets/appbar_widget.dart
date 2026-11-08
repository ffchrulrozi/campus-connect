import 'package:flutter/material.dart';

class AppbarWidget extends StatefulWidget {
  const new({super.key});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text("Camp-Connect", style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w700, fontSize: 20),),
          Spacer(),
          Icon(Icons.message),
        ],
      ),
    );
  }
}
