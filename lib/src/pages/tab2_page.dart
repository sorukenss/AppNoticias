import 'package:flutter/material.dart';
import 'package:ft_provider_proyect_noticias/src/models/categori_models.dart';
import 'package:ft_provider_proyect_noticias/src/services/new_response_services.dart';
import 'package:provider/provider.dart';


class Tab2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            
            Expanded(child: _LsitaCategoria())
          ],
        )
       ),
    );
  }
}

class _LsitaCategoria extends StatelessWidget {
 
 
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewService>(context).category;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (BuildContext contex, int index) {
        return Container(
          width: 110,
          child: Padding(
            padding: EdgeInsets.all(0.8),
            child: Column(
              children: [
                  _CategoriaBotones(categoria: categories[index]),
                  const SizedBox(height: 5,),
                  Text('${categories[index].name}')
            ]),
            ),
        );
      }
      );
  }
}

class _CategoriaBotones extends StatelessWidget {
  final Categoria categoria;
  const _CategoriaBotones({ required this.categoria});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Hola mundo');
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(categoria.icon, color: Colors.black54,),
      ),
    );
  }
}