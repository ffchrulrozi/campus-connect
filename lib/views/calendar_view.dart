import 'package:campus_connect/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime focusedDay = DateTime(2026, 11, 1);
  DateTime selectedDay = DateTime(2026, 11, 1);

  final List<CampusEvent> events = [
    CampusEvent(
      title: 'Informatic Engineering Student Gathering',
      startDate: DateTime(2026, 11, 1),
      endDate: DateTime(2026, 11, 1),
      description: 'Gathering together, together we gathering.'
    ),
    CampusEvent(
      title: 'Indonesia Economic Workshop',
      startDate: DateTime(2026, 11, 1),
      endDate: DateTime(2026, 11, 1),
      description: 'Landscap 2026 Indonesia Economy by Mr. Fachrul'
    ),
    CampusEvent(
      title: 'T-Days',
      startDate: DateTime(2026, 11, 3),
      endDate: DateTime(2026, 11, 5),
      description:
          'Three-day technology days by Engineering Student Association'
    ),
    CampusEvent(
      title: 'University Birthday',
      startDate: DateTime(2026, 11, 7),
      endDate: DateTime(2026, 11, 9),
      description: '25th University birthday'
    ),
    CampusEvent(
      title: 'National Holiday',
      startDate: DateTime(2026, 11, 20),
      endDate: DateTime(2026, 11, 20),
      description: 'National Holiday for xxx'
    ),
  ];

  List<CampusEvent> getEventsForDay(DateTime day) {
    return events.where((event) => event.occursOn(day)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvents = getEventsForDay(selectedDay);

    return Scaffold(
      appBar: AppBar(title: const Text('Campus Calendar')),

      body: Column(
        children: [
          TableCalendar<CampusEvent>(
            firstDay: DateTime(2026, 1, 1),
            lastDay: DateTime(2030, 12, 31),
            focusedDay: focusedDay,

            selectedDayPredicate: (day) => isSameDay(selectedDay, day),
            eventLoader: (day) => getEventsForDay(day),

            onDaySelected: (selected, focused) {
              setState(() {
                selectedDay = selected;
                focusedDay = focused;
              });
            },

            onPageChanged: (focused) => focusedDay = focused,

            calendarStyle: const CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          const Divider(),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Events on ${DateFormat("dd MMMM yyyy").format(selectedDay)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            child: selectedEvents.isEmpty
                ? const Center(child: Text('No events on this date'))
                : ListView.builder(
                    itemCount: selectedEvents.length,
                    itemBuilder: (context, index) {
                      final event = selectedEvents[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 5,
                            decoration: BoxDecoration(
                              color: baseColors[index%10],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          title: Text(
                            event.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${event.startDate.day} - ${event.endDate.day} November\n${event.description}',
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class CampusEvent {
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  CampusEvent({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description
  });

  bool occursOn(DateTime date) {
    final day = DateTime(date.year, date.month, date.day);
    final start = DateTime(startDate.year, startDate.month, startDate.day);
    final end = DateTime(endDate.year, endDate.month, endDate.day);

    return !day.isBefore(start) && !day.isAfter(end);
  }
}
