// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// class RangeScreen extends StatefulWidget {
//   @override
//   _RangeScreenState createState() => _RangeScreenState();
// }
//
// class _RangeScreenState extends State<RangeScreen> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//   String startYear = '';
//   String startDay = '';
//   String endYear = '';
//   String endDay = '';
//   bool switchValue = true;
//
//   void startAtDate(DateTime? dateTime) {
//     startYear = DateFormat('yyyy年', 'ja_JP').format(dateTime!);
//     startDay = DateFormat.MMMEd('ja').format(dateTime);
//   }
//
//   void endAtDate(DateTime? dateTime) {
//     endYear = DateFormat('yyyy年', 'ja_JP').format(dateTime!);
//     endDay = DateFormat.MMMEd('ja').format(dateTime);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('TableCalendar - Range'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Icon(Icons.date_range),
//                     SizedBox(width: 10),
//                     Text(
//                       '期間',
//                       style: TextStyle(
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Switch(
//                   value: switchValue,
//                   onChanged: (value) {
//                     setState(() {
//                       switchValue = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             if (!switchValue) SizedBox.shrink(),
//             if (!switchValue && (startDay != '' && endDay != ''))
//               Column(
//                 children: [
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         startDay,
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                       Container(
//                         width: 40,
//                         child: Center(child: Text('〜')),
//                       ),
//                       Text(
//                         endDay,
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             if (switchValue)
//               Column(
//                 children: [
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Container(
//                         height: 55,
//                         width: 130,
//                         decoration: BoxDecoration(
//                           color: Colors.orange,
//                           borderRadius: BorderRadius.circular(3),
//                         ),
//                         // child: TextFormField(
//                         //   controller: controller.startAtTextController,
//                         //   onTap: () {
//                         //     controller.updateCurrentFocused(0);
//                         //   },
//                         //   style: TextStyle(fontSize: 14),
//                         // ),
//                         // child: GestureDetector(
//                         //   onTap: () => controller.updateCurrentFocused(0),
//                         //   child: Center(
//                         //     child: Text(state.startDay),
//                         //   ),
//                         // ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               startYear,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               startDay,
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 40,
//                         child: Center(child: Text('〜')),
//                       ),
//                       Container(
//                         height: 55,
//                         width: 130,
//                         decoration: BoxDecoration(
//                           color: Colors.orange,
//                           borderRadius: BorderRadius.circular(3),
//                         ),
//                         // child: TextFormField(
//                         //   controller: controller.endAtDateTextController,
//                         //   onTap: () => controller.updateCurrentFocused(1),
//                         //   style: TextStyle(fontSize: 14),
//                         // ),
//                         // child: GestureDetector(
//                         //   onTap: () => controller.updateCurrentFocused(1),
//                         //   child: Center(
//                         //     child: Text(state.endDay),
//                         //   ),
//                         // ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               endYear,
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             Text(
//                               endDay,
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   TableCalendar(
//                     locale: 'ja_JP',
//                     firstDay: DateTime.utc(2020, 1, 1),
//                     lastDay: DateTime.utc(2030, 12, 31),
//                     focusedDay: _focusedDay,
//                     startingDayOfWeek: StartingDayOfWeek.monday,
//                     headerStyle: HeaderStyle(
//                       titleCentered: true,
//                       formatButtonVisible: false,
//                       leftChevronIcon: Icon(
//                         Icons.chevron_left,
//                         color: Colors.grey.shade400,
//                         size: 35,
//                       ),
//                       rightChevronIcon: Icon(
//                         Icons.chevron_right,
//                         color: Colors.grey.shade400,
//                         size: 35,
//                       ),
//                       headerPadding: EdgeInsets.only(top: 0, bottom: 5),
//                       leftChevronPadding: EdgeInsets.only(left: 0),
//                       rightChevronPadding: EdgeInsets.only(right: 0),
//                     ),
//                     calendarStyle: CalendarStyle(
//                       cellMargin: EdgeInsets.all(1),
//                       defaultDecoration:
//                           BoxDecoration(color: Colors.grey.shade200),
//                       todayTextStyle: TextStyle(color: Colors.black),
//                       todayDecoration: BoxDecoration(
//                         color: Colors.yellow,
//                       ),
//                       selectedDecoration: BoxDecoration(
//                         color: Colors.orange,
//                         shape: BoxShape.circle,
//                       ),
//                       weekendTextStyle: TextStyle(color: Colors.black),
//                       weekendDecoration:
//                           BoxDecoration(color: Colors.grey.shade200),
//                       outsideTextStyle: TextStyle(color: Colors.black),
//                       outsideDecoration:
//                           BoxDecoration(color: Colors.grey.shade200),
//                       rangeHighlightColor: Colors.orange.shade100,
//                       rangeStartDecoration: BoxDecoration(
//                         color: Colors.orange,
//                       ),
//                       rangeEndDecoration: BoxDecoration(
//                         color: Colors.orange,
//                       ),
//                     ),
//                     daysOfWeekHeight: 25,
//                     daysOfWeekStyle: DaysOfWeekStyle(
//                       weekdayStyle: TextStyle(color: Colors.grey),
//                       weekendStyle: TextStyle(color: Colors.grey),
//                     ),
//                     selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//                     rangeStartDay: _rangeStart,
//                     rangeEndDay: _rangeEnd,
//                     calendarFormat: _calendarFormat,
//                     rangeSelectionMode: _rangeSelectionMode,
//                     onDaySelected: (selectedDay, focusedDay) {
//                       if (!isSameDay(_selectedDay, selectedDay)) {
//                         setState(() {
//                           _selectedDay = selectedDay;
//                           _focusedDay = focusedDay;
//                           _rangeStart = null; // Important to clean those
//                           _rangeEnd = null;
//                           _rangeSelectionMode = RangeSelectionMode.toggledOff;
//                         });
//                       }
//                     },
//                     onRangeSelected: (start, end, focusedDay) {
//                       setState(() {
//                         _selectedDay = null;
//                         _focusedDay = focusedDay;
//                         _rangeStart = start;
//                         _rangeEnd = end;
//                         _rangeSelectionMode = RangeSelectionMode.toggledOn;
//                       });
//                       startAtDate(start);
//                       endAtDate(end);
//                     },
//                     onPageChanged: (focusedDay) {
//                       _focusedDay = focusedDay;
//                     },
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RangeScreen extends StatefulWidget {
  @override
  _RangeScreenState createState() => _RangeScreenState();
}

class _RangeScreenState extends State<RangeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Range'),
      ),
      body: TableCalendar(
        locale: 'ja_JP',
        startingDayOfWeek: StartingDayOfWeek.monday,
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        daysOfWeekHeight: 25,
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.grey),
          weekendStyle: TextStyle(color: Colors.grey),
        ),
        headerStyle: const HeaderStyle(
          titleCentered: true,
          titleTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Colors.grey,
            size: 35,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.grey,
            size: 35,
          ),
          headerPadding: EdgeInsets.symmetric(vertical: 7),
          rightChevronPadding: EdgeInsets.only(right: 0),
          leftChevronPadding: EdgeInsets.only(right: 0),
        ),
        calendarStyle: CalendarStyle(
          cellMargin: const EdgeInsets.all(1),
          defaultDecoration: BoxDecoration(color: Colors.grey.shade200),
          weekendTextStyle: const TextStyle(color: Colors.black),
          weekendDecoration: BoxDecoration(color: Colors.grey.shade200),
          outsideTextStyle: const TextStyle(color: Colors.black),
          outsideDecoration: BoxDecoration(color: Colors.grey.shade200),
          todayDecoration: BoxDecoration(
            color: Colors.green,
          ),
          // selectedDecoration: BoxDecoration(
          //   color: Colors.red,
          // ),
          rangeHighlightColor: Colors.orange.shade100,
          rangeStartDecoration: BoxDecoration(
            color: Colors.orange,
          ),
          rangeEndDecoration: BoxDecoration(
            color: Colors.orange,
          ),
        ),
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        calendarFormat: _calendarFormat,
        rangeSelectionMode: _rangeSelectionMode,
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              _rangeStart = null; // Important to clean those
              _rangeEnd = null;
              _rangeSelectionMode = RangeSelectionMode.toggledOff;
            });
          }
        },
        onRangeSelected: (start, end, focusedDay) {
          setState(() {
            _selectedDay = null;
            _focusedDay = focusedDay;
            _rangeStart = start;
            _rangeEnd = end;
            _rangeSelectionMode = RangeSelectionMode.toggledOn;
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
