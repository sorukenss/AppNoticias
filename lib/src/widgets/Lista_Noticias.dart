
import 'package:flutter/material.dart';
import 'package:ft_provider_proyect_noticias/src/models/models.dart';
import 'package:ft_provider_proyect_noticias/src/theme/mytheme.dart';


class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias({super.key, required this.noticias});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(noticia: this.noticias[index], index: index);
      }

    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia,index: index,),

        _TarjetaTitulo(noticia:noticia),

        _TarjetaImagen(noticia:noticia),

        _TarjetaBody(noticia:noticia),

        _TarjetaBotones(),

        const SizedBox(height: 15,),
        const Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            child: Icon(Icons.star_border_outlined),
            fillColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: (){

          }),
          RawMaterialButton(
            child: Icon(Icons.more),
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: (){

          }),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: noticia.description == null
      ? const Text('No hay descripcion')
      : Text(noticia.description),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
        child: Container(
          child: noticia.urlToImage != null
          ? FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
             image: NetworkImage(noticia.urlToImage),
              
             )
             : Image(image: AssetImage('assets/no-image.png'))
        ),
      ),
    );
  }
}


class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({required this.noticia});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title,style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}



class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar({
    super.key, required this.noticia, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
       children: [
           Text('${index + 1}. ', style: const TextStyle(color: Colors.redAccent),),
           Text('${noticia.source.name}. '),
      ]),
    );
  }
}