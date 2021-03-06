// import 'package:calender/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';
//
// void main() {
//   initializeDateFormatting('ja');
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

import 'package:calender/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting('ja');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(),
      home: FeedScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage();
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   bool _isCalendarOpen = false;
//
//   void _onTapButton() {
//     if (_isCalendarOpen) {
//       setState(() {
//         _isCalendarOpen = false;
//       });
//     } else {
//       setState(() {
//         _isCalendarOpen = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Home'),
//           actions: [
//             Row(
//               children: [
//                 Text(
//                   '今日',
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     _onTapButton();
//                   },
//                   icon: Icon(
//                     _isCalendarOpen
//                         ? Icons.arrow_drop_up
//                         : Icons.arrow_drop_down,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         body: Stack(
//           children: <Widget>[
//             Container(
//                 margin: EdgeInsets.only(top: (_isCalendarOpen ? 0.0 : 0.0)),
//                 color: Colors.white,
//                 child: getList()),
//             _isCalendarOpen ? UpperPop() : SizedBox.shrink(),
//           ],
//         ));
//   }
//
//   Widget getList() {
//     var list = [
//       "1",
//       "2",
//       "3",
//       "4",
//       "5",
//     ];
//     return ListView.builder(
//       itemBuilder: (BuildContext context, int index) {
//         if (index >= list.length) {
//           list.addAll([
//             "メッセージ",
//             "メッセージ",
//             "メッセージ",
//             "メッセージ",
//           ]);
//         }
//         return _messageItem(list[index]);
//       },
//     );
//   }
//
//   Widget _messageItem(String title) {
//     return Container(
//       decoration: new BoxDecoration(
//           border:
//               new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
//       child: ListTile(
//         title: Text(
//           title,
//           style: TextStyle(color: Colors.black, fontSize: 18.0),
//         ),
//         onTap: () async {
//           final data = ClipboardData(text: title);
//           await Clipboard.setData(data);
//           print(data.text);
//           final snackBar = SnackBar(content: Text('copied!: ${data.text!}'));
//
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }, // タップ
//         onLongPress: () {
//           print("onLongTap called.");
//         }, // 長押し
//       ),
//     );
//   }
// }
//
// class UpperPop extends StatefulWidget {
//   const UpperPop({Key? key}) : super(key: key);
//
//   @override
//   _UpperPopState createState() => _UpperPopState();
// }
//
// class _UpperPopState extends State<UpperPop> {
//   DateTime _focusedDay = DateTime.now();
//   String _displayDate = '今日';
//   DateTime? _selectedDay;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           color: Colors.white,
//           child: TableCalendar(
//             locale: 'ja_JP',
//             firstDay: DateTime.utc(2020, 1, 1),
//             lastDay: DateTime.utc(2030, 12, 31),
//             focusedDay: _focusedDay,
//             calendarFormat: _calendarFormat,
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             headerStyle: HeaderStyle(
//               titleCentered: true,
//               formatButtonVisible: false,
//               leftChevronIcon: Icon(
//                 Icons.chevron_left,
//                 color: Colors.grey.shade400,
//                 size: 35,
//               ),
//               rightChevronIcon: Icon(
//                 Icons.chevron_right,
//                 color: Colors.grey.shade400,
//                 size: 35,
//               ),
//               headerPadding: EdgeInsets.only(top: 10, bottom: 15),
//               leftChevronPadding: EdgeInsets.only(left: 0),
//               rightChevronPadding: EdgeInsets.only(right: 0),
//             ),
//             calendarStyle: CalendarStyle(
//               outsideDaysVisible: false,
//               todayDecoration: BoxDecoration(
//                 color: Colors.orange.shade200,
//                 shape: BoxShape.circle,
//               ),
//               selectedDecoration: BoxDecoration(
//                 color: Colors.orange,
//                 shape: BoxShape.circle,
//               ),
//               weekendTextStyle: TextStyle(color: Colors.black),
//             ),
//             daysOfWeekHeight: 20.0,
//             daysOfWeekStyle: DaysOfWeekStyle(
//               weekdayStyle: TextStyle(color: Colors.grey),
//               weekendStyle: TextStyle(color: Colors.grey),
//             ),
//             onFormatChanged: (CalendarFormat format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             /*どの日付が現在選択されているか判断*/
//             selectedDayPredicate: (DateTime day) {
//               /*bool値を返す*/
//               return isSameDay(_selectedDay, day);
//             },
//             onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
//               if (!isSameDay(_selectedDay, selectedDay)) {
//                 setState(() {
//                   _selectedDay = selectedDay; /*選択された日付*/
//                   _focusedDay = focusedDay; /*フォーカスが当たる日*/
//
//                   if (isSameDay(selectedDay, DateTime.now())) {
//                     _displayDate = '今日';
//                   } else {
//                     _displayDate = DateFormat.MMMEd('ja').format(selectedDay);
//                   }
//                 });
//               }
//             },
//           ),
//         ),
//         Expanded(
//           child: Container(
//             color: Colors.black54,
//           ),
//         ),
//       ],
//     );
//   }
// }

// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../utils.dart';

class TableRangeExample extends StatefulWidget {
  @override
  _TableRangeExampleState createState() => _TableRangeExampleState();
}

class _TableRangeExampleState extends State<TableRangeExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  // Can be toggled on/off by longpressing a date
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String startYear = '';
  String startDay = '';
  String endYear = '';
  String endDay = '';
  bool switchValue = false;

  void startAtDate(DateTime? dateTime) {
    // startAtTextController.text = DateFormat('yyyy年MM月dd日E曜日', 'ja_JP').format(dateTime)
    //startAtTextController.text = DateFormat.MMMEd('ja').format(dateTime);
    //state = state.copyWith(startAt: dateTime);
    // state = state.copyWith(startYear: startYear);
    // state = state.copyWith(startDay: startDay);
    startYear = DateFormat('yyyy年', 'ja_JP').format(dateTime!);
    startDay = DateFormat.MMMEd('ja').format(dateTime);
  }

  void endAtDate(DateTime? dateTime) {
    // endAtDateTextController.text = DateFormat('yyyy年MM月dd日E曜日', 'ja_JP').format(dateTime);
    // endAtDateTextController.text = DateFormat.MMMEd('ja').format(dateTime);
    // state = state.copyWith(endAt: dateTime);
    // state = state.copyWith(endYear: endYear);
    // state = state.copyWith(endDay: endDay);
    endYear = DateFormat('yyyy年', 'ja_JP').format(dateTime!);
    endDay = DateFormat.MMMEd('ja').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Range'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.date_range),
                    SizedBox(width: 10),
                    Text(
                      '期間',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                ),
              ],
            ),
            if (!switchValue) SizedBox.shrink(),
            if (!switchValue && (startDay != '' && endDay != ''))
              Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        startDay,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        width: 40,
                        child: Center(child: Text('〜')),
                      ),
                      Text(
                        endDay,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            if (switchValue)
              Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 55,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        // child: TextFormField(
                        //   controller: controller.startAtTextController,
                        //   onTap: () {
                        //     controller.updateCurrentFocused(0);
                        //   },
                        //   style: TextStyle(fontSize: 14),
                        // ),
                        // child: GestureDetector(
                        //   onTap: () => controller.updateCurrentFocused(0),
                        //   child: Center(
                        //     child: Text(state.startDay),
                        //   ),
                        // ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              startYear,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              startDay,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 40,
                        child: Center(child: Text('〜')),
                      ),
                      Container(
                        height: 55,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        // child: TextFormField(
                        //   controller: controller.endAtDateTextController,
                        //   onTap: () => controller.updateCurrentFocused(1),
                        //   style: TextStyle(fontSize: 14),
                        // ),
                        // child: GestureDetector(
                        //   onTap: () => controller.updateCurrentFocused(1),
                        //   child: Center(
                        //     child: Text(state.endDay),
                        //   ),
                        // ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              endYear,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              endDay,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TableCalendar(
                    locale: 'ja_JP',
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
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
                      headerPadding: EdgeInsets.only(top: 0, bottom: 5),
                      leftChevronPadding: EdgeInsets.only(left: 0),
                      rightChevronPadding: EdgeInsets.only(right: 0),
                    ),
                    calendarStyle: CalendarStyle(
                      cellMargin: EdgeInsets.all(1),
                      defaultDecoration:
                          BoxDecoration(color: Colors.grey.shade200),
                      todayTextStyle: TextStyle(color: Colors.black),
                      todayDecoration: BoxDecoration(
                        color: Colors.yellow,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(color: Colors.black),
                      weekendDecoration:
                          BoxDecoration(color: Colors.grey.shade200),
                      outsideTextStyle: TextStyle(color: Colors.black),
                      outsideDecoration:
                          BoxDecoration(color: Colors.grey.shade200),
                      rangeHighlightColor: Colors.orange.shade100,
                      rangeStartDecoration: BoxDecoration(
                        color: Colors.orange,
                      ),
                      rangeEndDecoration: BoxDecoration(
                        color: Colors.orange,
                      ),
                    ),
                    daysOfWeekHeight: 25,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.grey),
                      weekendStyle: TextStyle(color: Colors.grey),
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
                      startAtDate(start);
                      endAtDate(end);
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
