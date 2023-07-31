import 'package:flutter/material.dart';
import 'package:ft_provider_proyect_noticias/src/pages/pages.dart';
import 'package:ft_provider_proyect_noticias/src/services/services.dart';
import 'package:ft_provider_proyect_noticias/src/theme/mytheme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  NewService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Noticias-XD',
        home: TabsPage(),
      ),
    );
  }
}