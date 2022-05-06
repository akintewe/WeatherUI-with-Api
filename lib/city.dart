import 'package:flutter/material.dart';

class CityList extends StatefulWidget {
  const CityList({Key? key}) : super(key: key);

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body:
      Container(
        color: Colors.white30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Manage Cities', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32
            ),),
            Padding(padding: EdgeInsets.only(left: 500,top: 1, )),
            SizedBox(height: 80,),

            Container(
              height: 110,
              width: 430,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                    spreadRadius: 2,
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('San Diego, USA',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
                  Padding(padding: EdgeInsets.only(right: 40)),
                  Text('25\u00B0',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                  Icon(Icons.cloud, color: Colors.grey,),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 110,
              width: 430,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 30,
                    spreadRadius: 5,
                  )
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Chicago, USA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
                  Padding(padding: EdgeInsets.only(right: 40)),
                  Text('23\u00B0',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                  Icon(Icons.cloud, color: Colors.grey,),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 110,
              width: 430,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                boxShadow: [
                BoxShadow(
                color: Colors.grey,
                blurRadius: 30,
                spreadRadius: 5,
              ),

                ],

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Phoenix, USA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
                  Padding(padding: EdgeInsets.only(right: 40)),
                  Text('22\u00B0',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                  Icon(Icons.wb_sunny, color: Colors.yellow,size: 28,),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 110,
              width: 430,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 30,
                      spreadRadius: 5,
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('New York, USA',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
                  Padding(padding: EdgeInsets.only(right: 40)),
                  Text('29\u00B0',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
                  Icon(Icons.wb_sunny, color: Colors.yellow,
                  size: 28,),
                ],
              ),
            ),
          ],

        ),
        padding: EdgeInsets.only(bottom: 120),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Colors.black,
      child: IconButton(onPressed: (){},
      icon: Icon(Icons.add),),),
    );
  }
}
