import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/constants/palette/palette.dart';
import 'package:news_app_clean_architecture/domain/news_usecase/news_usecase.dart';
import 'package:news_app_clean_architecture/presentation/news_page/cubit/news_cubit.dart';

import '../../core/locator.dart';
import '../widgets/news_card.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(
        newsUsecase: getIt<NewsUsecase>(),
      )..fetchNews(null),
      child: const NewsHomeView(),
    );
  }
}

class NewsHomeView extends StatefulWidget {
  const NewsHomeView({super.key});

  @override
  State<NewsHomeView> createState() => _NewsHomeViewState();
}

class _NewsHomeViewState extends State<NewsHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backGroundColor,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextField(
            onSubmitted: (searchText) {
              if (searchText == "") {
                context.read<NewsCubit>().fetchNews(null);
              } else {
                context.read<NewsCubit>().fetchNews(searchText);
              }
            },
            style: const TextStyle(
              color: Palette.deepBlue,
              fontSize: 14,
            ),
            cursorColor: Palette.deepBlue,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Palette.lightGrey,
                size: 20,
              ),
              hintText: 'Search...',
              hintStyle: TextStyle(
                color: Palette.lightGrey,
                fontSize: 14,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Palette.lightGrey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Palette.deepBlue,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Top News',
            style: TextStyle(
              color: Palette.deepBlue,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NewsSucces) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.newsEntitiesList.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        item: state.newsEntitiesList[index],
                      );
                    },
                  ),
                );
              } else if (state is NewsError) {
                return const Center(
                  child: Text('Error'),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Palette.backGroundColor,
      elevation: 0,
      title: const Text(
        'News',
        style: TextStyle(
          fontSize: 24,
          color: Palette.deepBlue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
