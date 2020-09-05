import 'package:flutter/material.dart';
import 'package:go_farm/model/models.dart';
import 'package:go_farm/ui/constant/constant.dart';
import 'package:go_farm/ui/presentation/custom_icons_icons.dart';
import 'package:go_farm/ui/screens/widgets/recomend_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Appbar
          Padding(
            padding: const EdgeInsets.symmetric(vertical:26.0),
            child: _appBar(),
          ),
          // Content
          Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _widgetTitle('Category'),
                SizedBox(height: 10),
                _categoryList(),
                SizedBox(height: 30,),
                _widgetTitle('Recommended'),
                SizedBox(height: 10,),
                _recomended(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30)
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xff94b6f2),
            child: Icon(Icons.cloud, size: 30, color: Colors.white,),
            radius: 30.0,
          ),
          Flexible(
            child: ListTile(
              title: Text("Cloud Season"),
              subtitle: Text("November 2020 - January 2021"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetTitle(String title){
    return Text(
      title,
      style: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
    );
  }

  Widget _categoryList() {
    return Container(
      height: 140,
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          _categoryWidget(text: "Home", icon: CustomIcons.home_1, colorIcon: Colors.orange[300]),
          _categoryWidget(text: "Office", icon: CustomIcons.building),
          _categoryWidget(text: "Garden", icon: CustomIcons.spa, colorIcon: Colors.green),
          _categoryWidget(text: "Garden", icon: CustomIcons.spa, colorIcon: Colors.green),
            
        ],
      ),
    );


  }
  Widget _categoryWidget({IconData icon, String text, Color colorIcon}){
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Icon(icon, size: 35, color: colorIcon,),
            radius: 40,
          ),
          SizedBox(height: 15,)  ,
          Text(text, style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold,))
        ],
      ),
    );
  }

  Widget _recomended(c) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (deviceOrient(c) == Orientation.portrait ? 2 : 3),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
      ),
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: recommended.length,
      itemBuilder: (context, index) {
        final x = recommended[index];
        return RecommendedItem(recommedModel: x,);
      },    
    );
  }





}


// Wrap(
//       spacing: 10,
//       runSpacing: 20,
//       children: [
//         Container(
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 220,
//                 height: 150,
//                 color: Colors.red,
//               ),
//               SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Red Orchid'),
//                     SizedBox(height: 5,),
//                     Text('Orcided', style: TextStyle(color: Colors.grey, fontSize: 11),),

//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
        
//         Container(
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 220,
//                 height: 150,
//                 color: Colors.red,
//               ),
//               SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Red Orchid'),
//                     SizedBox(height: 5,),
//                     Text('Orcided', style: TextStyle(color: Colors.grey, fontSize: 11),),

//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
        
//         Container(
//           color: Colors.white,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: 220,
//                 height: 150,
//                 color: Colors.red,
//               ),
//               SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Red Orchid'),
//                     SizedBox(height: 5,),
//                     Text('Orcided', style: TextStyle(color: Colors.grey, fontSize: 11),),

//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
        
        
        
//       ],
//     );