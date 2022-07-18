import 'package:flutter/material.dart';
import 'package:rafia_task_01/config/color_config.dart';
import 'package:rafia_task_01/config/text_config.dart';
import 'package:rafia_task_01/models/day.dart';
import 'package:rafia_task_01/widgets/date_and_day.dart';
import 'package:rafia_task_01/widgets/time.dart';

class DurationScreen extends StatefulWidget {
  const DurationScreen({Key? key}) : super(key: key);

  @override
  State<DurationScreen> createState() => _DurationScreenState();
}

class _DurationScreenState extends State<DurationScreen> {
  
  // create a function which return the no of days in current month
  List<Day> getNoOfDays() {
    DateTime now = DateTime.now();
    List<DateTime> currentMonth = [];
    // create a list of dates of current month and add it to currentMonth list
    for (int i = 1; i <= now.day; i++) {
      currentMonth.add(DateTime(now.year, now.month, i));
    }
    
    List<Day> days = [];
// loop over currentMonth and e

  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          
        ],
        body: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Container(
                height: 130,
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
                        return DateAndDay(date: index, day: ,);
                      },
                      itemCount: getNoOfDays(),
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
                        return Time(time: index);
                      },
                      itemCount: 30,
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
                margin: const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: greenColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
                
                child: Row(children: [
                  Checkbox(
                      activeColor: greenColor,
                      value: true,
                      onChanged: (value) {
                        setState(() {
                          value = false;
                        });
                      }),
                  Text('I want to take an insurance for this servie.',
                      style: Theme.of(context).textTheme.checkBoxText),
                ]),
              ),
              const SizedBox(
                height: 80,
              ),
              Material(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BDT 2400',
                            style: Theme.of(context).textTheme.mainText,
                          ),
                          const Text('Sub Total',
                              style: TextStyle(
                                  fontFamily: 'Metropolis',
                                  color: greyColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16)),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: greenColor,
                        ),
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
         backgroundColor: containerColor,
        title: const Text('Guide Booking', style: TextStyle(color: blackColor, fontFamily: 'Metropolis', fontSize: 20, fontWeight: FontWeight.w500),),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: blackColor,), onPressed: (){},),
      ),
    );
  }
}
