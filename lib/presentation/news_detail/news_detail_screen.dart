import 'package:flutter/material.dart';

import '../../core/constants/palette/palette.dart';
import '../../data/data.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsEntities model;
  const NewsDetailScreen({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return NewsDetailView(
      entities: model,
    );
  }
}

class NewsDetailView extends StatefulWidget {
  final NewsEntities entities;
  const NewsDetailView({required this.entities, super.key});

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

String _getDateTimeddMMyyy(DateTime dateTime) {
  return '${dateTime.day} / ${dateTime.month} / ${dateTime.year}';
}

class _NewsDetailViewState extends State<NewsDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backGroundColor,
      appBar: AppBar(
        backgroundColor: Palette.backGroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: Palette.deepBlue,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                widget.entities.title ?? '',
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: Palette.lightGrey,
                height: MediaQuery.of(context).size.height / 2.7,
                child: Image.network(
                  widget.entities.imageUrl ??
                      'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                _getDateTimeddMMyyy(widget.entities.dateTime),
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.entities.author ?? '',
                style: const TextStyle(
                  color: Palette.lightGrey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.entities.content ?? "",
                style: const TextStyle(
                  color: Palette.deepBlue,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 34,
              )
            ],
          ),
        ),
      ),
    );
  }
}
