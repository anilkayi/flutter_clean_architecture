import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/data/entities/news_entities/news_entities.dart';
import 'package:news_app_clean_architecture/presentation/news_detail/news_detail_screen.dart';

import '../../core/constants/palette/palette.dart';

class NewsCard extends StatefulWidget {
  final NewsEntities item;
  const NewsCard({super.key, required this.item});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(model: widget.item),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 16,
        ),
        height: MediaQuery.of(context).size.height / 2.4,
        width: MediaQuery.of(context).size.width - (2 * 16),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              color: Palette.lightGrey,
              child: Image.network(
                widget.item.imageUrl ??
                    'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      widget.item.title ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Palette.deepBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
