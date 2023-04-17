import 'package:bank_ui/history_screen.dart';
import 'package:bank_ui/notch_clipper.dart';
import 'package:bank_ui/theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_app_bar.dart';

class TransferScreen extends StatelessWidget {
  static const routeName = "transfer-screen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.lightSkin,
        appBar: appBar("Transfer", context),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _moneyTransfer(context),
                _SelectPersons(),
                _SelectCards(),
                _SendNowButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _moneyTransfer(BuildContext context) => NotchContainer(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      height: 120,
      width: double.infinity,
      radius: 15,
      child: Container(
        margin: const EdgeInsets.only(top: 25, left: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Money Transfer Statistics \n",
                        style: Theme.of(context).textTheme.headlineSmall),
                    TextSpan(
                        text: "You spent 20% more money this month ",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14, color: const Color(0xff9b9793))),
                    TextSpan(
                        text: "than last month...",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 14, color: const Color(0xff9b9793))),
                    WidgetSpan(
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        child: GestureDetector(
                          child: Text(
                            "Read more",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 14,
                                    color: const Color(0xff3d352e),
                                    fontWeight: FontWeight.w800),
                          ),
                          onTap: () {},
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 5),
                child: InkWell(
                  child: CircleAvatar(
                    backgroundColor: CustomColors.lightSkin,
                    radius: 30,
                    child: Icon(
                      Icons.swap_horiz_rounded,
                      size: 22,
                      color: CustomColors.black,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );

class _SelectPersons extends StatelessWidget {
  final List<String> personsFace = [
    "assets/svgs/f1.svg",
    "assets/svgs/f4.svg",
    "assets/svgs/f3.svg",
    "assets/svgs/f5.svg",
    "assets/svgs/f2.svg",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Persons",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "View all",
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
          Container(
            height: 100,
            alignment: Alignment.centerLeft,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: DottedBorder(
                          borderType: BorderType.Circle,
                          color: const Color(0xfff0c49f),
                          dashPattern: [5],
                          strokeWidth: 1.5,
                          child: Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: const Icon(
                              Icons.add,
                              size: 35,
                              color: Color(0xfff3a663),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Row(
                    children: List.generate(
                      personsFace.length,
                      (index) => Container(
                        margin: const EdgeInsets.all(2),
                        child: GestureDetector(
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 28,
                            child: SvgPicture.asset(personsFace[index]),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class _SelectCards extends StatelessWidget {
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
                "Select Card",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                "View all",
                style: Theme.of(context).textTheme.headlineSmall,
              )
            ],
          ),
          Container(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                NotchContainer(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  radius: 10,
                  height: 190,
                  width: 180,
                  color: CustomColors.black,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/visa.svg",
                              height: 40,
                              // ignore: deprecated_member_use
                              color: CustomColors.white,
                            ),
                            Icon(
                              Icons.more_horiz_rounded,
                              size: 20,
                              color: CustomColors.white,
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Text(
                          "*** *** **9743",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: CustomColors.white,
                              ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Holder",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: const Color(0xff4b433f),
                                      fontSize: 14),
                            ),
                            Text(
                              "Exp Date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: const Color(0xff4b433f),
                                      fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Imran Khan",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: CustomColors.white,
                                        fontSize: 14),
                              ),
                            ),
                            Text(
                              "02/28",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: CustomColors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5)
                    ],
                  ),
                ),
                NotchContainer(
                  margin: const EdgeInsets.only(top: 10, right: 10),
                  radius: 10,
                  height: 190,
                  width: 180,
                  color: CustomColors.white,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/paypal.svg",
                              height: 40,
                            ),
                            Icon(
                              Icons.more_horiz_rounded,
                              size: 20,
                              color: CustomColors.black,
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Text(
                          "*** *** **1093",
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Holder",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: const Color(0xffdedadb),
                                      fontSize: 14),
                            ),
                            Text(
                              "Exp Date",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: const Color(0xffdedadb),
                                      fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Imran Khan",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontSize: 14),
                              ),
                            ),
                            Text(
                              "02/28",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomColors.black,
                  ),
                ),
                const SizedBox(width: 5),
                const CircleAvatar(
                  radius: 4,
                  backgroundColor: Color(0xff857b74),
                ),
                const SizedBox(width: 5),
                const CircleAvatar(
                  radius: 4,
                  backgroundColor: Color(0xff857b74),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SendNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: NotchContainer(
          margin:
              const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
          color: CustomColors.black,
          radius: 15,
          height: 65,
          width: MediaQuery.of(context).size.width * .9,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Send Now",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: CustomColors.white),
              ),
            ),
          )),
      onTap: () => Navigator.pushNamed(context, HistoryScreen.routeName),
    );
  }
}
