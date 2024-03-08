// ignore_for_file: file_names

import 'dart:async';
import 'package:news_tre/data/models/NewsModel.dart';
import 'package:news_tre/data/webclient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<CheckNEWS>(_checkNews);
  }

  Future<FutureOr<void>> _checkNews(
      CheckNEWS event, Emitter<MainState> emit) async {
    try {
      emit(CheckingNews());
      NewsModel apple;
      apple = NewsModel.fromJson(await WebClient.get(
          'v2/everything?q=apple&from=2023-11-21&to=2023-11-21&sortBy=popularity&apiKey=cd5c7f9f829b4a27a450ea0b2310a476'));
      if (apple.status == 'ok') {
        emit(NewsChecked(
          apple: apple,
        ));
      } else {
        emit(NewsError(error: "Please login again"));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}

class MainEvent {}

class MainState {}

class CheckNEWS extends MainEvent {}

class CheckingNews extends MainState {
  CheckingNews();
}

class NewsChecked extends MainState {
  final NewsModel apple;
  NewsChecked({
    required this.apple,
  });
}

class NewsError extends MainState {
  final String error;
  NewsError({required this.error});
}
