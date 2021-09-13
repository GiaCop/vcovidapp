import 'dart:convert';
import 'package:covidapp/model/covid_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class getApi {
  // fetch (get) Video List

  Future<List<CovidModel>> fetchCovidList() async {
    List<CovidModel> covidList = [];
    //var fullVideosUrl = ApiUrls().VIDEOS_URL;
    var response ;
    try{
       response = await http.get(Uri.parse('https://owsnews.herokuapp.com/covid'));
        var e=response.statusCode;
        print("StatusCode: $e");
    }
    catch(e)
    {
      print(e.toString());
    }
    var body = json.jsonDecode(response.body);
    //Log().printJson(json: body);
         List jsonList = body['data'];
      for( var jsonItem in jsonList )
        {
          CovidModel  covidModel= CovidModel.fromJson(jsonItem);
          covidList.add(covidModel);
        }
        return covidList;
    }
   
  
   
  }

  // update User Information


