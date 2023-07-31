

import 'package:flutter/material.dart';
import 'package:ft_provider_proyect_noticias/src/services/services.dart';
import 'package:ft_provider_proyect_noticias/src/widgets/widgets.dart';
import 'package:provider/provider.dart';


class Tab1Page extends StatefulWidget {

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {

      final newService = Provider.of<NewService>(context);
      newService.headlines;

    return Scaffold(
      body: (newService.headlines.length == 0)
      ? Center(child: CircularProgressIndicator(color: Colors.red,),)
      :ListaNoticias(noticias: newService.headlines),
   );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}