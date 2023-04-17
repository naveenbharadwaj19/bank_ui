import 'package:bank_ui/custom_app_bar.dart';
import 'package:bank_ui/notch_clipper.dart';
import 'package:bank_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}

class HistoryScreen extends StatelessWidget {
  static const routeName = "history-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("History", context),
      backgroundColor: CustomColors.lightGreen,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ExpenseNotch(),
              _DateSelection(),
              _Chart(),
              _LatestPayment(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExpenseNotch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotchContainer(
      margin: const EdgeInsets.only(top: 20),
      height: 120,
      width: MediaQuery.of(context).size.width * .9,
      radius: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Container(
            margin:
                const EdgeInsets.only(top: 12, bottom: 5, left: 10, right: 10),
            child: NotchContainer(
                margin: const EdgeInsets.all(0),
                color: const Color(0xff141d21),
                radius: 10,
                height: 90,
                width: 100,
                child: Container(
                  margin: const EdgeInsets.only(top: 12, left: 10, bottom: 5),
                  child: Row(
                    children: [
                      const Flexible(
                        child: CircleAvatar(
                          backgroundColor: Color(0xff283943),
                          radius: 30,
                          child: Icon(
                            Icons.arrow_downward_rounded,
                            size: 22,
                            color: Color(0xffbeccd2),
                          ),
                        ),
                      ),
                      Flexible(
                          child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Income",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: CustomColors.white),
                            ),
                            Text("\$983.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: CustomColors.white,
                                        fontWeight: FontWeight.bold))
                          ],
                        ),
                      ))
                    ],
                  ),
                )),
          )),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: [
                  Flexible(
                    child: CircleAvatar(
                      backgroundColor: CustomColors.lightGreen,
                      radius: 30,
                      child: Icon(
                        Icons.arrow_upward_rounded,
                        size: 22,
                        color: CustomColors.black,
                      ),
                    ),
                  ),
                  Flexible(
                      child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expense",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: const Color(0xffa9aaac)),
                        ),
                        Text("\$983.0",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: CustomColors.black,
                                    fontWeight: FontWeight.bold))
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateSelection extends StatefulWidget {
  @override
  State<_DateSelection> createState() => __DateSelectionState();
}

class __DateSelectionState extends State<_DateSelection> {
  int index = 0;
  Color selectedColor = const Color(0xff141d21);
  Color unSelectedColor = CustomColors.lightGreen;
  void updateSelection(int idx) => setState(() {
        index = idx;
      });

  Widget rangeButtom(
          {required Color color,
          required String text,
          required Color textColor,
          required void Function()? onTap,
          required BuildContext context}) =>
      InkWell(
        child: Ink(
          child: NotchContainer(
            margin: const EdgeInsets.all(0),
            color: color,
            radius: 10,
            notchHeight: 15,
            notchWidth: 80,
            bumpSize: 17,
            height: 70,
            width: 140,
            child: Center(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: textColor),
              ),
            ),
          ),
        ),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return NotchContainer(
      margin: const EdgeInsets.only(top: 30, left: 5, right: 5),
      radius: 15,
      height: 180,
      width: MediaQuery.of(context).size.width * .95,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
        child: Wrap(
          spacing: 20,
          runSpacing: 10,
          children: [
            rangeButtom(
                color: index == 0 ? selectedColor : unSelectedColor,
                textColor: index == 0 ? CustomColors.white : CustomColors.black,
                text: "Last 7 Days",
                onTap: () => updateSelection(0),
                context: context),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: rangeButtom(
                  color: index == 1 ? selectedColor : unSelectedColor,
                  textColor:
                      index == 1 ? CustomColors.white : CustomColors.black,
                  text: "30 Days",
                  onTap: () => updateSelection(1),
                  context: context),
            ),
            rangeButtom(
                color: index == 2 ? selectedColor : unSelectedColor,
                textColor: index == 2 ? CustomColors.white : CustomColors.black,
                text: "Custom",
                onTap: () => updateSelection(2),
                context: context),
          ],
        ),
      ),
    );
  }
}

class _Chart extends StatefulWidget {
  @override
  State<_Chart> createState() => _ChartState();
}

class _ChartState extends State<_Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
            labelStyle:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14)),
        primaryYAxis: NumericAxis(
            labelStyle:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14)),
        series: <FastLineSeries>[
          FastLineSeries<ChartData, String>(
            dataSource: [
              ChartData('Sat', 0),
              ChartData('Sun', 3000),
              ChartData('Mon', 4000),
              ChartData('Tue', 4500),
              ChartData('Wed', 5000),
              ChartData('Thu', 7000),
            ],
            width: 2,
            xValueMapper: (data, _) => data.x,
            yValueMapper: (data, _) => data.y,
            color: CustomColors.black,
            onPointDoubleTap: (details) {},
          ),
        ],
      ),
    );
  }
}

class _LatestPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Latest Payment",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "View all",
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
          NotchContainer(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            width: MediaQuery.of(context).size.width * .9,
            radius: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: CustomColors.lightGreen,
                  radius: 30,
                  child: Icon(
                    Icons.flash_on_sharp,
                    size: 28,
                    color: CustomColors.black,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Electric Bill",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 14),
                    ),
                    Text(
                      "Today 1:44AM",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            color: const Color(0xffa9aaac),
                          ),
                    )
                  ],
                ),
                GestureDetector(
                  child: Icon(
                    Icons.more_horiz_rounded,
                    size: 24,
                    color: CustomColors.black,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
