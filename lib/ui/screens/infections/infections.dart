import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_farm/model/models.dart';
import 'package:go_farm/ui/constant/constant.dart';
import 'package:go_farm/ui/screens/widgets/infection_item.dart';
import 'package:go_farm/ui/screens/widgets/recomend_item.dart';
import 'package:go_farm/ui/screens/widgets/search_item.dart';

class Infections extends StatefulWidget {
  @override
  _InfectionsState createState() => _InfectionsState();
}

class _InfectionsState extends State<Infections> {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 45.0),
          child: Column(
            children: [
              _appBar(),
              SizedBox(height: 10.0),
              _infectionList()
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
          "Infections",
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

  Widget _infectionList() {
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
          itemCount: infectionList.length,
          itemBuilder: (context, index) {
            final x = infectionList[index];
            return InfectionItem(
              infectionsModel: x,
            );
          },
        );
      },
    );
  }

}