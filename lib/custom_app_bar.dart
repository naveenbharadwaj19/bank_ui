import 'package:bank_ui/theme.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String title,BuildContext context) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 100,
      leadingWidth: 80,
      leading: Container(
        margin: const EdgeInsets.only(top: 10, left: 10),
        child: InkWell(
          child: CircleAvatar(
            backgroundColor: CustomColors.white,
            radius: 30,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 22,
              color: CustomColors.black,
            ),
          ),
          onTap: () {},
        ),
      ),
      centerTitle: true,
      title: Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          )),
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 10, right: 15),
          child: InkWell(
            child: CircleAvatar(
              backgroundColor: CustomColors.white,
              radius: 35,
              child: Icon(
                Icons.more_horiz_rounded,
                size: 22,
                color: CustomColors.black,
              ),
            ),
            onTap: () {},
          ),
        ),
      ],
    );