import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutternews/core/constants/constants.dart';
import 'package:flutternews/features/daily_news/presentation/bloc/article/remote_article_bloc.dart';
import 'package:flutternews/features/daily_news/presentation/widgets/article_tile.dart';

class DaliyNews extends StatelessWidget {
  const DaliyNews({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RemoteArticleBloc>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daily News'),
        ),
        body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
          builder: (context, state) {
            if (state.isLoading) {
              return _buildLoading();
            }
            if (state.error != null) {
              return _buildErroView(
                  state.error?.message ?? 'Something Went Wrong');
            }
            if (state.articles.isEmpty) {
              return _buildNoData();
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton(
                          hint: const Text('Category'),
                          value: state.currentCategory,
                          items: categories
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              bloc.add(ChangeCategoryEvent(value));
                            }
                          }),
                      DropdownButton(
                          hint: const Text('Country'),
                          value: state.currentCountry,
                          items: countryCodes
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              bloc.add(ChangeCountryEvent(value));
                            }
                          })
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.articles.length,
                    itemBuilder: (context, index) =>
                        ArticleTile(article: state.articles[index]),
                  ),
                ),
              ],
            );
          },
        ));
  }

  _buildErroView(String msg) {
    return Center(child: Text(msg));
  }

  _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildNoData() {
    return const Center(
      child: Text('No Data'),
    );
  }
}
