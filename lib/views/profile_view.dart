import 'package:campus_connect/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfileView extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileWidget(),
          SizedBox(height: 25),
          ProfileQrCodeWidget(),
          SizedBox(height: 25),
          JoinedEventWidget(),
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(
            width: 110,
            height: 110,
            child: ClipOval(
              child: Image.network(
                "https://i.pravatar.cc/125?img=1",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fachrul Rozi",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text("Student ID: 1029384756"),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Informatic Engineering"),
                    Text("Faculty of Industrial Technology"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileQrCodeWidget extends StatelessWidget {
  const ProfileQrCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        data: 'fachrul rozi - 1029384756',
        version: QrVersions.auto,
        size: 200,
        backgroundColor: Colors.white,
      ),
    );
  }
}

class JoinedEventWidget extends StatefulWidget {
  const new({super.key});

  @override
  State<JoinedEventWidget> createState() => _JoinedEventWidgetState();
}

class _JoinedEventWidgetState extends State<JoinedEventWidget> {
  var joinedEvents = [
    JoinedEvent(
      title: "T-Days",
      at: DateTime(2026, 11, 08),
      by: "Engineering Student Association",
    ),
    JoinedEvent(
      title: "International Student Gathering",
      at: DateTime(2026, 11, 03),
      by: "International Student Affair",
    ),
    JoinedEvent(
      title: "Indonesia Economic 2026 Workshop",
      at: DateTime(2026, 10, 15),
    ),
    JoinedEvent(
      title: "Univeristy Birthday Ceremony",
      at: DateTime(2026, 09, 12),
    ),
    JoinedEvent(title: "Major Student Gathering", at: DateTime(2026, 08, 10)),
  ];

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Joined Events"),
          Divider(color: Colors.blueGrey),
          ...joinedEvents.map((joinedEvent) {
            return ListTile(
              leading: Container(
                width: 5,
                decoration: BoxDecoration(
                  color: baseColors[index++ % 10],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              title: Text(joinedEvent.title ?? ""),
              subtitle: Text(
                "By. ${joinedEvent.by} at ${DateFormat("dd MMMM yyyy").format(joinedEvent.at!)}",
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class JoinedEvent {
  String? title;
  DateTime? at;
  String? by;

  JoinedEvent({this.title, this.at, this.by});
}
