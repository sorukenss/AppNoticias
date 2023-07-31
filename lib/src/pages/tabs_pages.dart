import 'package:flutter/material.dart';
import 'package:ft_provider_proyect_noticias/src/pages/pages.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  static const String routeName='tabspage';
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>  _NavegacionModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

      final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginalActual=i,
      items: const[ 
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),label: 'Para ti' 
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.public_outlined),label: 'Encabezados' 
          ),
    ]);
  }
}

class _Pages extends StatelessWidget {
  const _Pages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.paginaController,
      //physics: BouncingScrollPhysics(),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        
        Tab1Page(),
        
        Tab2Page(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{

  int _paginaActual =0;
  PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  set paginalActual(int valor){
    this._paginaActual=valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();

  }
 PageController get paginaController => this._pageController;
 
}