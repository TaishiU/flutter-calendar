import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MultiScreen extends StatefulWidget {
  @override
  _MultiScreenState createState() => _MultiScreenState();
}

class _MultiScreenState extends State<MultiScreen> {
  // final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);

  // Using a `LinkedHashSet` is recommended due to equality comparison override
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  //final Set<DateTime> _selectedDays = {};

  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  void dispose() {
    //_selectedEvents.dispose();
    super.dispose();
  }

  // List<Event> _getEventsForDay(DateTime day) {
  //   // Implementation example
  //   return kEvents[day] ?? [];
  // }
  //
  // List<Event> _getEventsForDays(Set<DateTime> days) {
  //   // Implementation example
  //   // Note that days are in selection order (same applies to events)
  //   return [
  //     for (final d in days) ..._getEventsForDay(d),
  //   ];
  // }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
    });

    //_selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  @override
  Widget build(BuildContext context) {
    print('_selectedDays: $_selectedDays');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('TableCalendar - Multi'),
      ),
      body: Column(
        children: [
          TableCalendar<dynamic>(
            locale: 'ja_JP',
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.grey.shade400,
                size: 35,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
                size: 35,
              ),
              headerPadding: EdgeInsets.symmetric(vertical: 10),
              leftChevronPadding: EdgeInsets.only(left: 0),
              rightChevronPadding: EdgeInsets.only(right: 0),
            ),
            daysOfWeekHeight: 25,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.grey),
              weekendStyle: TextStyle(color: Colors.grey),
            ),
            calendarStyle: CalendarStyle(
              cellMargin: EdgeInsets.all(1),
              defaultDecoration: BoxDecoration(color: Colors.grey.shade200),
              todayTextStyle: TextStyle(color: Colors.black),
              todayDecoration: BoxDecoration(
                color: Colors.yellow,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
              ),
              weekendTextStyle: TextStyle(color: Colors.black),
              weekendDecoration: BoxDecoration(color: Colors.grey.shade200),
              outsideTextStyle: TextStyle(color: Colors.black),
              outsideDecoration: BoxDecoration(color: Colors.grey.shade200),
              rangeHighlightColor: Colors.orange.shade100,
              rangeStartDecoration: BoxDecoration(
                color: Colors.orange,
              ),
              rangeEndDecoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            //eventLoader: _getEventsForDay,
            selectedDayPredicate: (day) {
              // Use values from Set to mark multiple days as selected
              return _selectedDays.contains(day);
            },
            onDaySelected: _onDaySelected,
            // onPageChanged: (focusedDay) {
            //   _focusedDay = focusedDay;
            // },
          ),
          ElevatedButton(
            child: Text('Clear selection'),
            onPressed: () {
              setState(() {
                _selectedDays.clear();
                //_selectedEvents.value = [];
              });
            },
          ),
          const SizedBox(height: 8.0),
          // Expanded(
          //   child: ValueListenableBuilder<List<Event>>(
          //     valueListenable: _selectedEvents,
          //     builder: (context, value, _) {
          //       return ListView.builder(
          //         itemCount: value.length,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             margin: const EdgeInsets.symmetric(
          //               horizontal: 12.0,
          //               vertical: 4.0,
          //             ),
          //             decoration: BoxDecoration(
          //               border: Border.all(),
          //               borderRadius: BorderRadius.circular(12.0),
          //             ),
          //             child: ListTile(
          //               onTap: () => print('${value[index]}'),
          //               title: Text('${value[index]}'),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

// class Event {
//   final String title;
//
//   const Event(this.title);
//
//   @override
//   String toString() => title;
// }

// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);
//
// final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
//     key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
//     value: (item) => List.generate(
//         item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
//   ..addAll({
//     kToday: [
//       Event('Today\'s Event 1'),
//       Event('Today\'s Event 2'),
//     ],
//   });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
