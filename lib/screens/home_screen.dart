import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _focusedDay = DateTime.now();
  String _displayDate = '今日';
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(_displayDate),
            Icon(
              Icons.arrow_drop_up,
              size: 25,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TableCalendar(
              locale: 'ja_JP',
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
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
                headerPadding: EdgeInsets.only(top: 10, bottom: 15),
                leftChevronPadding: EdgeInsets.only(left: 0),
                rightChevronPadding: EdgeInsets.only(right: 0),
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                todayDecoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.black),
              ),
              daysOfWeekHeight: 20.0,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.grey),
                weekendStyle: TextStyle(color: Colors.grey),
              ),
              onFormatChanged: (CalendarFormat format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              /*どの日付が現在選択されているか判断*/
              selectedDayPredicate: (DateTime day) {
                /*bool値を返す*/
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay; /*選択された日付*/
                    _focusedDay = focusedDay; /*現在の日付*/
                    // print('selectedDay: $selectedDay');
                    // print('focusedDay: $focusedDay');
                    // print('selectedDay: $_selectedDay');
                    // print('focusedDay: $_focusedDay');
                    // print('push push push');

                    if (isSameDay(selectedDay, DateTime.now())) {
                      _displayDate = '今日';
                    } else {
                      _displayDate = DateFormat.MMMEd('ja').format(selectedDay);
                      // print('selectedDay: $_selectedDay');
                      // print('focusedDay: $_focusedDay');
                    }
                  });
                }
              },
            ),
          ),
          SizedBox(height: 60),
          Container(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Home'),
            ),
          ),
        ],
      ),
    );
  }
}
