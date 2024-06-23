import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/features/daily_news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:flutternews/features/daily_news/presentation/pages/home/daliy_news.dart';
import 'package:google_fonts/google_fonts.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(GetArticlesEvent()),
      child: MaterialApp(
          title: 'Flutter News',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textTheme: GoogleFonts.openSansTextTheme()),
          home: const DaliyNews()),
    );
  }
}
