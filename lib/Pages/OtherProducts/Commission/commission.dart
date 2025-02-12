// @dart=2.9

import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/advancecommission.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/catalogue.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/Commissions.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/date.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/showusers.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommissionT extends StatefulWidget {
  List<Commission> dataco = <Commission>[];
  CommissionT({Key key}) : super(key: key);

  @override
  _CommissionTState createState() => _CommissionTState();
}

class _CommissionTState extends State<CommissionT> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            getcommissions(HomeBlocInheritedWidget.of(context).homebloc.user),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          final Acommission data = snapshot.data;
          print(data);
          return FutureBuilder(
              future:
                  getTotal(HomeBlocInheritedWidget.of(context).homebloc.user),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.grey[600],
                    toolbarHeight: getVerticalPercent(context, 12),
                    title: CustomText(
                        data: 'Comisiones',
                        size: getVerticalPercent(context, 5),
                        color: whiteNeutral,
                        weight: FontWeight.bold),
                  ),
                  body: SafeArea(
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.white,
                      padding: EdgeInsets.only(
                          left: getHorizontalPercent(context, 5),
                          right: getHorizontalPercent(context, 5)),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(getVerticalMargin(context)),
                        physics: BouncingScrollPhysics(),
                        children: [
                          ShowUsers(),
                          SizedBox(
                            height: getVerticalPercent(context, 5),
                          ),
                          Date(),
                          SizedBox(
                            height: getVerticalPercent(context, 5),
                          ),
                          CommissionsTa(dataco: data),
                          SizedBox(
                            height: getVerticalPercent(context, 5),
                          ),
                          CustomText(
                            data: 'Total a pagar | ' +
                                '\$ ' +
                                snapshot.data.totalc.toString(),
                            size: getVerticalPercent(context, 4),
                          ),
                          SizedBox(
                            height: getVerticalPercent(context, 5),
                          ),
                          ButtonSend(
                            sizeh: 10,
                            sizew: 100,
                            text: 'Catalogo de Comisiones',
                            sizef: 5,
                            page: Catalogue(),
                            pageContext: context,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
