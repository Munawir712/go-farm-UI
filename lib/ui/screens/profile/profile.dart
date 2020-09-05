import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_farm/model/models.dart';
import 'package:go_farm/ui/constant/constant.dart';
import 'package:go_farm/ui/screens/widgets/seed_item.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
        length: 2,
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget> [
                  SliverAppBar(
                    elevation: 0.5,
                    toolbarHeight: deviceOrient(context) == Orientation.portrait ? 150 : 150 ,
                    backgroundColor: Colors.white,
                    // pinned: true,
                    // floating: true,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage('assets/img/1.png'),
                          ),
                          SizedBox(height: 5,),
                          Text("Munawir", style: TextStyle(fontSize: 16,),),
                          Text(
                            "Petani di Harvest Moon BTN", 
                            style: TextStyle(fontSize: 12, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    bottom: TabBar(
                      indicatorWeight: 3,
                      indicatorColor: primaryColor,
                      labelColor: primaryColor,
                      labelStyle: TextStyle(fontWeight: FontWeight.w500),
                      unselectedLabelColor: Color(0xffafb1b0),
                      tabs: [
                        Tab(text: "Detail",),
                        Tab(text: "My Favourite",),
                      ]
                    ),
                  )
                ];
              },
              body: TabBarView(
                children: [
                  _detailItem(),
                  _favoriteItems()
                ],
            ),
            )
        ),
      ),
    );
  }

  Widget _detailItem() {
    return SingleChildScrollView(

      child: Column(
        children: [
          ListTile(
            title: Text("Gender",),
            subtitle: Text("Male"),
          ),
          ListTile(
            title: Text("Email",),
            subtitle: Text("munawirjr2@local.com"),
          ),
          ListTile(
            title: Text("Address",),
            subtitle: Text("Darussalam Street"),
          ),
      ],
    ),
  );
}

  Widget _favoriteItems() {
    return Builder(
      builder: (context) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (deviceOrient(context) == Orientation.portrait ? 2 : 3),
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 15.0,
          ),
          padding: EdgeInsets.all(20),
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: seedsList.length,
          itemBuilder: (context, index) {
            final seedItems = seedsList[index];
            return SeedItem(seedModel: seedItems,);
          },
        );
      },
    );
  }


}