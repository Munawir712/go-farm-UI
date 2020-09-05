import 'package:flutter/material.dart';
import 'package:go_farm/ui/constant/constant.dart';
import 'package:go_farm/ui/presentation/custom_icons_icons.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _imageCover(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              height: deviceHeight(context) / 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                    child: _content(),
                  ),
                  Expanded(
                    child: _button(context)
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }

  Widget _button(c) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: FlatButton(onPressed: (){}, child: Text('Login To Continue', style: TextStyle(color: Colors.white ),),),
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: FlatButton(
              onPressed: () => Navigator.popAndPushNamed(c, '/menu'), 
              child: Text('Continue To Guest',),
            ),
          ),
      ],
    );
  }

  Widget _imageCover() {
    return Builder(
      builder: (context) {
        return Container(
          height: deviceHeight(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/frame.jpg'),
              fit: BoxFit.cover
            )
          ),
        );
      },
    );
  }

  Widget _content() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(CustomIcons.leaf_3, size: 40, color: Colors.green,),
          SizedBox(height: 10),
          Text("Helping your farming", style: TextStyle(fontSize: 30, color: Colors.white),),
          Text("become easier", style: TextStyle(fontSize: 30, color: Colors.white),),
        ],
      ),
    );
  }

}