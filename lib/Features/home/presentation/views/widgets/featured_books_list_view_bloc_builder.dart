import 'package:book_ui/Features/home/presentation/manger/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_ui/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBloc extends StatelessWidget {
  const FeaturedBooksListViewBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
  return const FeaturedBooksListView();
}else if( state is FeaturedBooksFailureState){
   
  return Center(child: Text(state.errMessage.toString()));
}else{

  return const Center(child: CircularProgressIndicator());
}
      },
    );
  }
}
