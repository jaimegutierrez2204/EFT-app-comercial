//Icono de favoritos
import 'package:eft_app_comercial/Classes/fav_and_like.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavoriteIcon extends StatefulWidget {
  //Variables
  int announcementId;
  Color containerColor;
  bool favorite = false;
  bool noRepeat = true;

  //Constructor
  FavoriteIcon({this.announcementId, this.containerColor});

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  Widget build(BuildContext context) {
    if (widget.noRepeat) isFavorite();
    return Container(
        height: getHorizontalPercent(context, 15),
        width: getHorizontalPercent(context, 15),
        color: widget.containerColor,
        alignment: Alignment.center,
        child: IconButton(
            icon: Icon(
                widget.favorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                color: widget.favorite ? Colors.red : Colors.black,
                size: getHorizontalPercent(context, 10)),
            onPressed: onClick));
  }

  //Metodos
  void isFavorite() {
    widget.noRepeat = false;
    for (int c = 0; c < Marketing.favAndLikeList.length; c++) {
      if (Marketing.favAndLikeList[c].id == widget.announcementId) {
        widget.favorite = Marketing.favAndLikeList[c].favorite;
        break;
      }
    }
  }

  // ignore: missing_return
  bool onClick() {
    setState(() {
      widget.favorite = !widget.favorite;
      if (!insertInList(widget.announcementId)) {
        //Solicitud para insertar nuevo
        Marketing.favAndLikeList.add(new Reactions(
            id: widget.announcementId, favorite: true, like: false));
        print("se insertó");
        return;
      }
      if (widget.favorite) {
        //Solicitud para cambiar a falso
        return;
      }
      //Solicitud para cambiar a verdadero
      return;
    });
  }
}