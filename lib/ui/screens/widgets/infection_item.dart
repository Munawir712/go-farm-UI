import 'package:flutter/material.dart';
import 'package:go_farm/ui/constant/constant.dart';
import 'package:go_farm/ui/screens/infections/infection_detail.dart';

class InfectionItem extends StatefulWidget {
  final infectionsModel;
  InfectionItem({@required this.infectionsModel});
  @override
  _InfectionItemState createState() => _InfectionItemState();
}

class _InfectionItemState extends State<InfectionItem> {

  bool isLongPress = false;
  double marginVertical = 0;
  double marginHorizontal = 0;
  IconData _iconData = Icons.favorite_border;
  void onLongPress() {
    setState(() {
      isLongPress = true;
      marginVertical = 25;
      marginHorizontal = 15;
    });
  }

  void favorite() {
    if (_iconData != Icons.favorite) {
        setState(() {
        _iconData = Icons.favorite;
      });
    } else {
      setState(() {
        _iconData = Icons.favorite_border;
      });
    }
  }

  void onLongPressEnd() {
    setState(() {
      marginVertical = 0;
      marginHorizontal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(vertical: marginVertical, horizontal: marginHorizontal),
      decoration: BoxDecoration(
      color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InfectionDetail(infectionsModel: widget.infectionsModel))),
        onLongPress: () => onLongPress(),
        onLongPressEnd: (val) => onLongPressEnd(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Flexible(
              child: Stack(
              alignment: Alignment.topRight,
              children: [
                _imageCover(),
                IconButton(icon: Icon(_iconData), color: Colors.white, onPressed:() => favorite(),),
              ],
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _title(),
                  SizedBox(height: 5,),
                  _subTitle(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _imageCover() {
    return Container(
      height: deviceHeight(context) * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:  AssetImage(widget.infectionsModel['path']),
          fit: BoxFit.cover,
        )
      ),
    );
  }

  Widget _title() {
    return Text(
      widget.infectionsModel['name'],
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        color: Colors.black87,
        fontSize: 15,
      ),
    );
  }

  Widget _subTitle() {
    return Text(
      widget.infectionsModel['name'],
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        color: Colors.black38,
        fontSize: 12,
      ),
    );
  }
  


}