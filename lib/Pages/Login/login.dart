// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/home.dart';
import 'package:eft_app_comercial/Widgets/Login/header.dart';
import 'package:eft_app_comercial/Widgets/Login/loginform.dart';
import 'package:eft_app_comercial/Widgets/Login/logo.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  static int user;
  static int station;
  static String name;
  static String nameStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteLight,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: FutureBuilder(
            future: getLogedUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              //if (user == null)
                return ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(top: 0),
                  physics: BouncingScrollPhysics(),
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Header(),
                        Logo(),
                      ],
                      // ignore: deprecated_member_use
                    ),
                    SizedBox(
                      height: getVerticalPercent(context, 15),
                    ),
                    LoginForm(),
                  ],
                );
              return Home(
                  user: user,
                  station: station,
                  name: name,
                  nameStation: nameStation);
            }),
      ),
    );
  }
}
