import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:rafia_task_01/config/color_config.dart';
import 'package:rafia_task_01/config/text_config.dart';
import 'package:rafia_task_01/models/day.dart';
import 'package:rafia_task_01/models/time.dart';

import 'package:rafia_task_01/widgets/date_and_day.dart';
import 'package:rafia_task_01/widgets/time.dart';

class DurationScreen extends StatefulWidget {
  const DurationScreen({Key? key}) : super(key: key);

  @override
  State<DurationScreen> createState() => _DurationScreenState();
}

class _DurationScreenState extends State<DurationScreen> {
  late List<Day> days;
  late List<TimeModel> times;
  double _value = 0;
  bool checkedTheBox = true;

  // create a function which return the no of days in current month
  List<Day> getNoOfDays() {
    DateTime now = DateTime.now();
    List<DateTime> currentMonth = [];
    // create a list of dates of current month from start of month to end of month (inclusive)
    for (int i = 1; i <= DateTime(now.year, now.month, 0).day; i++) {
      currentMonth.add(DateTime(now.year, now.month, i));
    }

    List<Day> days = [];
    // loop over currentMonth and extract the day of the week and add it to days list
    for (DateTime date in currentMonth) {
      days.add(Day(
        date.day,
        DateFormat('EEE').format(date),
      ));
    }
    return days;
  }

  List<TimeModel> getCurrentTime({DateTime? selectedDate}) {
    DateTime _selectedDate = selectedDate ?? DateTime.now();
    List<DateTime> currentTime = [];
    // if _selectedDate is today, then add DateTime increased by 1 hour till the end of the today which is 11 PM
    // to currentTime list from current time to current time + 1 hour

    if (_selectedDate.day == DateTime.now().day) {
      for (int i = DateTime.now().hour; i <= 23; i++) {
        currentTime.add(DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
          i,
        ));
      }
    } else {
      // if _selectedDate is not today, then add DateTime increased by 1 hour till the end of the day which is 11 PM
      // to currentTime list from current time to current time + 1 hour
      for (int i = 0; i <= 23; i++) {
        currentTime.add(DateTime(
          _selectedDate.year,
          _selectedDate.month,
          _selectedDate.day,
          i,
        ));
      }
    }

    List<TimeModel> times = [];

    // loop over currentTime and extract the time in AM/PM format and add it to times list
    for (DateTime time in currentTime) {
      times.add(TimeModel(
        DateFormat('hh:mm').format(time),
        DateFormat('a').format(time),
      ));
    }

    return times;
  }

  @override
  void initState() {
    super.initState();
    days = getNoOfDays();
    times = getCurrentTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[],
        body: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                height: 130,
                child: Column(
                  children: [
                    Text(
                      'Duration',
                      style: Theme.of(context)
                          .textTheme
                          .pickADate
                          .copyWith(fontSize: 20),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              elevation: 3, disabledThumbRadius: 6),
                          valueIndicatorColor: containerColor,
                          activeTrackColor: greenColor,
                          inactiveTrackColor: shadowColor,
                          thumbColor: greenColor),
                      child: Slider(
                        min: 0,
                        max: 2400,
                        value: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            '6hrs',
                            style: Theme.of(context).textTheme.pickADate,
                          ),
                        ),
                        Text(
                          'BDT',
                          style: Theme.of(context)
                              .textTheme
                              .pickADate
                              .copyWith(color: greyColor),
                        ),
                        Text(
                          '2400',
                          style: Theme.of(context).textTheme.pickADate,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 15, left: 24),
                    child: Text(
                      'Pick A Date',
                      style: Theme.of(context).textTheme.pickADate,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // create a new Day object with isSelected set to true
                            // and replace the old Day object with the new one
                            // at the same index in days list
                            // and set all other days isSelected to false

                            setState(() {
                              days[index] = Day(
                                days[index].date,
                                days[index].weekDay,
                                isSelected: !days[index].isSelected,
                              );
                              for (int i = 0; i < days.length; i++) {
                                if (i != index) {
                                  days[i] = Day(
                                    days[i].date,
                                    days[i].weekDay,
                                    isSelected: false,
                                  );
                                }
                              }
                              times = getCurrentTime(
                                selectedDate: DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  days[index].date,
                                ),
                              );
                            });
                          },
                          child: DateAndDay(
                            day: days[index],
                          ),
                        );
                      },
                      itemCount: days.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15, left: 24),
                    child: Text(
                      'Start Time',
                      style: Theme.of(context).textTheme.pickADate,
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Time(
                            time: times[index].time,
                            timeString: times[index].timeString,
                          ),
                        );
                      },
                      itemCount: times.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 37),
                color: greenColor.withOpacity(0.2),
                child: Flex(direction: Axis.horizontal, children: [
                  Checkbox(
                      activeColor: greenColor,
                      value: checkedTheBox,
                      onChanged: (value) {
                        setState(() {
                          checkedTheBox = value!;
                        });
                      }),
                  Flexible(
                    child: Text('I want to take an insurance for this servie.',
                        overflow: TextOverflow.visible,
                        style: Theme.of(context).textTheme.checkBoxText),
                  ),
                ]),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        builder: (context) {
          return Material(
            elevation: 6,
            child: SizedBox(
              height: 130,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'BDT 2400',
                          style: Theme.of(context).textTheme.mainText,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Sub Total',
                          style: Theme.of(context)
                              .textTheme
                              .pickADate
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: greenColor,
                      ),
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(26, 15, 26, 15),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        )),
                        child: Text(
                          'Pay Now',
                          style: Theme.of(context).textTheme.mainText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        onClosing: () {},
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: containerColor,
        title: const Text(
          'Guide Booking',
          style: TextStyle(
              color: blackColor,
              fontFamily: 'Metropolis',
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

