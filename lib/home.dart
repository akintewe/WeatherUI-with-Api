import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherui/city.dart';
import 'package:weatherui/network.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Network _network = Network();
  late Future<Weather> futureWeather;

  void initState() {
    super.initState();
    futureWeather = _network.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.5),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.dehaze,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _network.getWeather();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CityList()));
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              )),
        ],
        centerTitle: true,
        title: Text(
          'Akure',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Container(
        color: Colors.white,
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: FutureBuilder<Weather>(
                    future: _network.getWeather(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [

                            Padding(
                                padding: EdgeInsets.only(
                              left: 500,
                            )),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 300,
                              child: Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  Image.network(
                                    "https://openweathermap.org/img/wn/${snapshot.data!.image.toString()}@4x.png",
                                  ),
                                  Text(
                                    '${snapshot.data!.temperature.toString()}\u00B0C',
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                            color: Colors.yellow.withOpacity(0.9),
                                            blurRadius: 30,
                                            offset: Offset(20.0, 10.0),
                                          )
                                        ],
                                        color: Colors.black,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${snapshot.data!.description.toString()}',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ],
                              )),
                            ),
                            Padding(padding: EdgeInsets.only(top: 20, bottom: 20)),

                            Container(
                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 12,
                                          blurRadius: 20,
                                        ),
                                      ]

                                    ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('wind'),
                                        Text('${snapshot.data!.wind.toString()} km/h',),
                                        Icon(Icons.cloud)
                                      ],
                                    )
                                  ),
                                  Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 12,
                                            blurRadius: 20,
                                          )
                                        ]

                                    ),
                                      child:Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('Index UV'),
                                          Text('${snapshot.data!.pressure.toString()} mmHg',),
                                          Icon(Icons.wb_sunny_outlined,)
                                        ],
                                      )
                                  ),


                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 12,
                                          blurRadius: 20,
                                        )
                                      ]

                                  ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Temperature'),
                                        Text('${snapshot.data!.temperature.toString()}\u00B0C',),
                                        Icon(Icons.thermostat_outlined)
                                      ],
                                    )
                                ),
                                Container(
                                  height: 100,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 12,
                                          blurRadius: 20,
                                        )
                                      ]

                                  ),
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Humidity'),
                                        Text( '${snapshot.data!.humidity.toString()}%',),
                                        Icon(Icons.water_drop)
                                      ],
                                    )
                                ),


                              ],
                            ),

                          ],
                        );
                      } else if (snapshot.hasError) {
                        return AlertDialog(
                          title: Text(
                            'Network Error',
                            style: TextStyle(fontSize: 30, color: Colors.blue),
                          ),
                        );
                      }
                      return Center(
                          child: const CircularProgressIndicator(
                        backgroundColor: Colors.deepPurpleAccent,
                      ));
                    }))
          ],
        ),
      ),
    );
  }
}
