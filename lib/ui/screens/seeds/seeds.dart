
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_farm/model/models.dart';
import 'package:go_farm/ui/constant/constant.dart';
import 'package:go_farm/ui/screens/widgets/search_item.dart';
import 'package:go_farm/ui/screens/widgets/seed_item.dart';

class Seeds extends StatefulWidget {
  @override
  _SeedsState createState() => _SeedsState();
}

class _SeedsState extends State<Seeds> {

  var searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal:15.0, vertical: 45.0),
          child: Column(
            children: <Widget>[
              _appBar(),
              SizedBox(height: 10,),
              _seedList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Seeds List",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10,),
      SearchItem(controller: searchController,),
      ],
    );
  }

  Widget _seedList() {
    return Builder(
      builder: (context) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (deviceOrient(context) == Orientation.portrait ? 2 : 3),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
          ),
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: seedsList.length,
          itemBuilder: (context, index) {
            final x = seedsList[index];
              return SeedItem(seedModel: x,);
          },
        );
      }, 
    );
  }



}

