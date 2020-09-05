import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_farm/ui/presentation/custom_icons_icons.dart';

class SeedDetail extends StatelessWidget {
  final seedModel;
  SeedDetail({this.seedModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SeedDetailBody(
        seedModel: seedModel,
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

class SeedDetailBody extends StatefulWidget {
  final seedModel;
  SeedDetailBody({this.seedModel});
  @override
  _SeedDetailBodyState createState() => _SeedDetailBodyState();
}

class _SeedDetailBodyState extends State<SeedDetailBody> {

  Color backgroundColor = Colors.transparent;
  Color iconColor = Colors.white;

  ScrollController scrollController;
  _scrollListener() {
    if(scrollController.offset >= 100 ) {
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
    scrollController = new ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: _content(),
          controller: scrollController,
        ),
        _appBar(),
      ],
    );
  }

  Widget _appBar() {
    return Builder(
      builder: (context) {
        return Column(
          children: [
            Container(
              height: 24,
              color: backgroundColor,
            ),
            Container(
              color: backgroundColor,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: iconColor,), 
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: iconColor,), 
                    onPressed: () {}
                  )
                ],
              )
            )
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
                image: AssetImage(widget.seedModel['path']),
                fit: BoxFit.cover,
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.seedModel['name'], style: TextStyle(fontSize: 20, ),),
                SizedBox(height: 5,),
                Text(widget.seedModel['name'], style: TextStyle(fontSize: 11, color: Colors.grey),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(CustomIcons.tree, size: 20, color: Colors.green,),
                    SizedBox(width: 5),
                    Text('Dry', style: TextStyle(fontSize: 11, color: Colors.grey),),
                    SizedBox(width: 25),
                    Icon(Icons.settings, size: 20, color: Colors.orange[300],),
                    SizedBox(width: 5),
                    Text('6-12 Months', style: TextStyle(fontSize: 11, color: Colors.grey),),

                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  child: Text(
                    'Tulip is genus name for 100 species of flowering plant that belong the Liliaceae family. Tulip originates from Central Asia, grows wild in the Pamir and Hindu Kush montains and steppes in Kazakhstan. The Netherlands in know as the land of tulips.',),
                ),
                Text(
                    '1. Planting Your Tulip Bulbs Roots \n2. Choose a shady place \n3. Choose a well-permeable sandy soil with a pH of 6 to 6.5'),
              ],
            ),
          ),
        ],
      ),
    );
  }

}