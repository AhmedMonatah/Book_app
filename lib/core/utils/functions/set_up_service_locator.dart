import 'package:book_ui/Features/home/data/datasource/home_local_data_source.dart';
import 'package:book_ui/Features/home/data/datasource/remote_data_source.dart';
import 'package:book_ui/Features/home/data/repo/home_repo_imp.dart';
import 'package:book_ui/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
  final gitit = GetIt.instance;

void setUpServiceLocator() {
  gitit.registerSingleton<ApiService>(ApiService(Dio()),);
  gitit.registerSingleton<HomeRepoImplementation>(
              HomeRepoImplementation(
            homeRemoteDataSource: HomeRemoteDataSourceImplementation(apiService: gitit.get<ApiService>())
          , homeLocalDataSource: HomeLocalDataSourceImplementation()
          )
  );
} 