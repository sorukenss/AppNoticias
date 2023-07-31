import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ft_provider_proyect_noticias/src/models/models.dart';
import 'package:http/http.dart' as http;


final _URL_NEWS='https://newsapi.org/v2';
final _APIKEY='1adc339355cf4f829229a5a63e24faa7';

class NewService with ChangeNotifier{

  List<Article> headlines = [];

  List<Categoria> category =[
   Categoria(icon:FontAwesomeIcons.building,name:'business'),
   Categoria(icon:FontAwesomeIcons.tv,name:'entertainment'),
   Categoria(icon:FontAwesomeIcons.addressCard,name:'general'),
   Categoria(icon:FontAwesomeIcons.headSideVirus,name:'health'),
   Categoria(icon:FontAwesomeIcons.vials,name:'science'),
   Categoria(icon:FontAwesomeIcons.volleyball,name:'sports'),
   Categoria(icon:FontAwesomeIcons.memory,name:'technology'),
  ];

  NewService(){
    
    this.getTopHeadlines();
  }


  getTopHeadlines() async{
    
    final url='$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=co&category=business';
    final resp = await http.get(Uri.parse(url));

    final newResponse = Newresponse.fromRawJson(resp.body);

    this.headlines.addAll(newResponse.articles);
    notifyListeners();
  }

}