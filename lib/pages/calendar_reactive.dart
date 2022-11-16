import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendar_reactive extends StatefulWidget {
  static String tag = 'home-page';
  const calendar_reactive({Key? key}) : super(key: key);

  @override
  _calendar_reactiveState createState() => _calendar_reactiveState();
}

class _calendar_reactiveState extends State<calendar_reactive>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image = 'assets/UTT.jpeg';

  List<String> miImages = [
    'assets/UTT.jpeg',
    'assets/utt_logo_ver_6.png',
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabController!.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0.0,
          pinned: true,
          backgroundColor: Colors.deepPurple,
          expandedHeight: 350.0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Reservacion UTT'),
            background: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 8.0,
          backgroundColor: Colors.deepPurple,
          title: Align(
            alignment: AlignmentDirectional.center,
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.greenAccent,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: 'Edificio P',
                ),
                Tab(
                  text: 'Edificio C',
                ),
                Tab(
                  text: 'Edificio D',
                ),
                Tab(
                  text: 'Edificio H',
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 500.0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SfCalendar(
                view: CalendarView.month,
                monthViewSettings: MonthViewSettings(showAgenda: true),
                dataSource: MeetingDataSource(getApointments()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<Appointment> getApointments() {
  List<Appointment> meeting = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meeting.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Sala del edificio P apartada',
      color: Colors.red));

  return meeting;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
