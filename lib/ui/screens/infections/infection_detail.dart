import 'package:flutter/material.dart';
import 'package:go_farm/ui/presentation/custom_icons_icons.dart';

class InfectionDetail extends StatelessWidget {
  final infectionsModel;
  InfectionDetail({@required this.infectionsModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfectionDetailBody(
        infectionsModel: infectionsModel
      ),
      bottomNavigationBar: _buttonAddFavorite(),
    );
  }

  Widget _buttonAddFavorite() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 30, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
      ),
      child: FlatButton(onPressed: (){}, child: Text('Add To Favorite', style: TextStyle(color: Colors.white ),),),
    );
  }

}


class InfectionDetailBody extends StatefulWidget {
  final infectionsModel;
  InfectionDetailBody({@required this.infectionsModel});
  @override
  _InfectionDetailBodyState createState() => _InfectionDetailBodyState();
}

class _InfectionDetailBodyState extends State<InfectionDetailBody> {

  Color backgroundColor = Colors.transparent;
  Color iconColor = Colors.white;

  ScrollController scrollController;
  _scrollListener() {
    if (scrollController.offset >= 100) {
      setState(() {
        backgroundColor = Colors.white;
        iconColor = Colors.black87;
      });
    } else {
      setState(() {
        backgroundColor = Colors.transparent;
        iconColor = Colors.white;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: _content(),
          controller: scrollController,
        ),
        _appBar()
      ],
    );
  }

  Widget _appBar() {
    return Builder(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Container(
              height: 24,
              color: backgroundColor,
            ),
            Container(
              height: 50,
              color: backgroundColor,  
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: iconColor,), 
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: iconColor,), 
                    onPressed: null
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _content() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.infectionsModel['path']),
                fit: BoxFit.cover,
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.infectionsModel['name'], style: TextStyle(fontSize: 20, ),),
                SizedBox(height: 5,),
                Text(widget.infectionsModel['name'], style: TextStyle(fontSize: 11, color: Colors.grey),),
                SizedBox(height: 20,),
                Container(
                  child: Text(widget.infectionsModel['desc']),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }


}