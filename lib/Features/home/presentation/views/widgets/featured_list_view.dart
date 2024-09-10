import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/presentation/manger/featured_book_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late final ScrollController _scrollController;
  var nextPage=1;
  void initState() {
    super.initState();
    _scrollController=ScrollController();
    _scrollController.addListener(_scrollListerner);
  }
  
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
void _scrollListerner() {
  if(_scrollController.position.pixels>= 0.7*_scrollController.position.maxScrollExtent){
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
      pageNumber: nextPage++
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(
                image: widget.books[index].imageUrl??'',
              ),
            );
          }),
    );
  }
}
