import 'package:book_ui/Features/home/data/repo/home_repo_imp.dart';
import 'package:book_ui/Features/home/domain/entites/book_entity.dart';
import 'package:book_ui/Features/home/domain/use_case/fetch_featured_books_use_case.dart';
import 'package:book_ui/Features/home/domain/use_case/fetch_newest_books_use_case.dart';
import 'package:book_ui/Features/home/presentation/manger/featch_newest_books/featch_newest_books_cubit.dart';
import 'package:book_ui/Features/home/presentation/manger/featured_book_cubit/featured_books_cubit.dart';
import 'package:book_ui/constants.dart';
import 'package:book_ui/core/utils/app_router.dart';
import 'package:book_ui/core/utils/functions/set_up_service_locator.dart';
import 'package:book_ui/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setUpServiceLocator();
  await Hive.openBox<BookEntity>(kfeatherBok);
  await Hive.openBox<BookEntity>(kfeatherNewBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}


  final gitit = GetIt.instance;

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>FeaturedBooksCubit (
          FetchFeaturedBooksUseCase(
            gitit<HomeRepoImplementation>(),
          ),)..fetchFeaturedBooks(),
        ),
         BlocProvider(
          create: (context) =>FeatchNewestBooksCubit (
          FetchNewstBooksUseCase(
            gitit<HomeRepoImplementation>(),
          ),),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
