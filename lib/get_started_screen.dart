import 'package:bank_ui/notch_clipper.dart';
import 'package:bank_ui/theme.dart';
import 'package:bank_ui/transfer_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:swipe_to/swipe_to.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: Container(
        color: CustomColors.purpleBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.black,
                    ),
                    width: 100,
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffcfcadc),
                    ),
                    width: 100,
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffcfcadc),
                    ),
                    width: 100,
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20, left: 40, right: 20),
                child: SvgPicture.asset(
                  "assets/svgs/hand.svg",
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                )),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Take Control Of Your \nFinances Today!",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Text("""
with our app users can manage their account,transaction history and other account details in real-time""",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 14,
                      color: const Color(0xff858195),
                      fontWeight: FontWeight.w200)),
            ),
            const Spacer(),
            _GetStartedButton()
          ],
        ),
      )),
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotchContainer(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        height: 70,
        width: MediaQuery.of(context).size.width * .85,
        radius: 15,
        color: const Color(0xff16122a),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: SwipeTo(
                  rightSwipeWidget: Container(),
                  onRightSwipe: () =>
                      Navigator.pushNamed(context, TransferScreen.routeName),
                  offsetDx: 2.5,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: CustomColors.purpleBg,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: CustomColors.black,
                      ),
                    ),
                  )),
            ),
            Positioned(
              left: 80,
              top: 28,
              child: Text(
                "Get Started",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: CustomColors.white),
              ),
            ),
            Positioned(
              top: 20,
              right: 10,
              child: Image.asset(
                "assets/images/arrow.png",
                fit: BoxFit.contain,
              ),
            )
          ],
        ));
  }
}
