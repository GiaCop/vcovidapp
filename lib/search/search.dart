import 'package:covidapp/model/covid_model.dart';
import 'package:covidapp/resource/getapi.dart';
import 'package:flutter/material.dart';

class SearchUser extends SearchDelegate {
  //FetchUserList _userList = FetchUserList();


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //return Container(child:Text("aaaaaaaaaa"));
   return FutureBuilder<List<CovidModel>>(
                  future: getApi().fetchCovidList(query: query),
                  builder: (BuildContext context, AsyncSnapshot? snapshot) {
                    if (snapshot!.hasData) {
              // videoList = snapshot.data!;
                    //  List<CovidModel> dataIndex= snapshot.data ?? [];
                  // snapshot.data=>List<CovidModel> dataIndex= snapshot.data ?? [];

                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                         
                            //   newDataList=List.from(videoList);
                            //  // newDataList =List.from(dataIndex);

                            // hello = videoList[index].nhiem ?? "";
                            return ListTile(
                              title: Text(" ${snapshot.data[index]?.tinh ?? ""}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                              subtitle: Text(
                                  "Ca nhiễm: ${snapshot.data[index]?.nhiem ?? ""}"),
                              // leading: CircleAvatar(
                              //         radius: 30,
                              //         backgroundImage: NetworkImage(snapshot.data[index]['picture']['large'])),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Container(
                          child: Center(
                        child: Text('Ko tim thay data'),
                      ));
                    } else
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    //return snapshot.data;
                  },
                );
             
             
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search User'),
    );
  }
}