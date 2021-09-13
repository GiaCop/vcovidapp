import 'dart:async';
import 'dart:ui';

import 'package:covidapp/model/covid_model.dart';
import 'package:covidapp/resource/getapi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    late Future<CovidModel> futureCovid;
    //CovidModel nv=CovidModel("KA", data:{"S","A","SA","Ấ"} );
       String? _timeString;

  @override
  void initState(){
    // _timeString = "${DateTime.now().hour} : ${DateTime.now().minute} :${DateTime.now().second}";
    // Timer.periodic(Duration(seconds:1), (Timer t)=>_getCurrentTime());
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
  //  int current=0;
    _timeString = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

    return Scaffold(
      
   body: TabBarView(children: 
       [
    
                   new Container(
                            child: Column(
                              children: [
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                               
                                 child: new Container(child: 
                                 
                                 
                                 
                                 
                                 
                                 new Text("Nguồn: Bộ Y Tế. $_timeString ", style: TextStyle(color:Color(0xFF3F5AA6)),)),
                               ),
                                //"Nguồn: Bộ Y Tế, Thời gian: "
                                
                                     //s         DateFormat('MM/dd/yyyy hh:mm:ss').format(DateTime.now()),

                                ///TEST TIME///////////////////////////////
                                ///
                                  Expanded(
                                   flex: 3, 
                                    child: FutureBuilder<List<CovidModel>>(
                                                                future: getApi().fetchCovidList(),
                                                             builder: (BuildContext context, AsyncSnapshot? snapshot){
                                                                
                                                                 if(snapshot!.hasData){
                                    List<CovidModel> videoList = snapshot.data!;
                                                                   return ListView.builder(
                                                       itemCount: snapshot.data.length,
                                                       itemBuilder: (BuildContext context, int index){
                                                        // int ina=index-snapshot.data.length
                                                        //.data[index]['picture']['large'])),
                                                         return  ListTile(                 
                                                            title: Text(videoList[index].tinh??"",
                                                           style:TextStyle(color: Colors.black,fontSize: 20)),
                                                           subtitle: Text("Ca nhiễm hôm nay: ${snapshot.data[index]?.nhiem??""}") , 
                                                          // leading: CircleAvatar(
                                                          //         radius: 30,
                                                          //         backgroundImage: NetworkImage(snapshot.data[index]['picture']['large'])),
                                                          
                                                         );
                                                      
                                                       }
                                  
                                  
                                                                   
                                                                   );
                                                                 }
                                                                 else if(snapshot.hasError){
                                                                   return Container(
                                                       child: Center(child: Text('Ko tim thay data'),)
                                                                   );
                                                                 }
                                                                 else 
                                                                 return Container(
                                                                   child: Center(child: CircularProgressIndicator(),),
                                                                 );
                                                             //return snapshot.data;
                                                             },
                                                            
                                                            ),
                                  ),
                            
                              ],
                            )
   )                          
                        
   
      
      ,Container(child: Text("data2"),)
      ,Container(child: Text("data3"),)
       ,Container(child: Text("data4"),)
       ]
   
   
   )
    );
  }

  _getCurrentTime() {
    setState(() {
  _timeString = "${DateTime.now().day} / ${DateTime.now().month} /${DateTime.now().year}";
    });
  }

  
}






