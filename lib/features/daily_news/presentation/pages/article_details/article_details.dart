import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutternews/features/daily_news/domain/entities/article.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  final ArticleEntity article;
  const ArticleDetails(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CachedNetworkImage(imageUrl: article.urlToImage!),
              const Gap(10),
              Text(
                article.title ?? '',
                style: textTheme.titleLarge,
              ),
              const Gap(10),
              Text(
                'Author : ${article.author}',
                style: textTheme.titleSmall,
              ),
              Text(
                'Published At ${DateFormat.yMEd().format(DateTime.parse(article.publishedAt!))}',
                style: textTheme.labelMedium,
              ),
              const Gap(10),
              Text(
                article.content ?? '',
                style: textTheme.bodyMedium,
              ),
              const Gap(10),
              TextButton(
                  onPressed: () {
                    if (article.url == null) {
                      print("is null");
                      return;
                    }
                    launchUrl(Uri.parse(article.url!));
                  },
                  child: const Text("View In Browser"))
            ],
          ),
        ),
      ),
    );
  }
}
