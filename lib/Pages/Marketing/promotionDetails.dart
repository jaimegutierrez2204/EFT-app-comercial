import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/temporal_List.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

//Detalles de las promociones
class PromotionDetails extends StatelessWidget {
  PromotionDetails({Key key, this.announcement}) : super(key: key);
  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    double margin = getVerticalMargin(context);
    double tripleMargin = margin * 3;
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: announcement.name,
                size: 20,
                color: grayText,
                weight: FontWeight.bold),
            backgroundColor: graySubtitle),
        body: Container(
            height: double.infinity,
            child: Column(children: [
              Expanded(
                  flex: 10,
                  child: ListView(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: tripleMargin, bottom: tripleMargin),
                      child: InkWell(
                          onTap: () {
                            showDialogText(context, "Descripción", announcement.text);
                          },
                          child: Container(
                              height: getVerticalPercent(context, 56),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                      image: NetworkImage(announcement.image),
                                      fit: BoxFit.fill)))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: margin),
                      child: CustomText(
                          data: "Detalles de la promoción.",
                          size: 14,
                          color: grayText),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: margin),
                      child:
                          CustomText(data: "Notas:", size: 14, color: grayText),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: tripleMargin),
                        child: Container(
                            height: getVerticalPercent(context, 15),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: detailsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: EdgeInsets.only(left: margin),
                                      child: Container(
                                          width:
                                              getHorizontalPercent(context, 45),
                                          padding: EdgeInsets.all(margin),
                                          decoration: BoxDecoration(
                                              color: purpleLigth,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Column(children: <Widget>[
                                            CustomText(
                                                data: detailsList[index].title,
                                                size: 14,
                                                color: whiteLight,
                                                weight: FontWeight.bold),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                      height:
                                                          getVerticalPercent(
                                                              context, 7.5),
                                                      width: getVerticalPercent(
                                                          context, 7.5),
                                                      decoration: BoxDecoration(
                                                          color: purpleDark,
                                                          shape:
                                                              BoxShape.circle)),
                                                  Container(
                                                      width:
                                                          getHorizontalPercent(
                                                              context, 25),
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: CustomText(
                                                          data:
                                                              detailsList[index]
                                                                  .subtitle,
                                                          size: 14,
                                                          color: whiteLight))
                                                ])
                                          ])));
                                })))
                  ])),
              Container(
                  height: getVerticalPercent(context, 8.5),
                  alignment: Alignment.centerRight,
                  color: graySubtitle2,
                  child: Container(
                      width: getHorizontalPercent(context, 32),
                      color: blueDark,
                      alignment: Alignment.center,
                      child: CustomText(
                          data: announcement.categoryName, size: 14, color: whiteLight)))
            ])));
  }
}