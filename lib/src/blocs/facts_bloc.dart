import "package:flutter/material.dart";
import 'dart:async';

import 'package:numbers_facts_app/src/blocs/bloc.dart';
import 'package:numbers_facts_app/src/resources/ApiClient.dart';

class FactsBloc implements Bloc {

  String _numberString;

  StreamController _streamController = StreamController<String>();
  Stream<String> get stream  => _streamController.stream;

  void getFacts(String numberString) async{
    _numberString = numberString;

    final isConnected = await ApiClient.isConnected();
    if(!isConnected)
      _streamController.add(Future.error("error"));


    final facts = await ApiClient.getFacts(numberString).catchError( (error) {
      _streamController.addError(error);
    });
    _streamController.sink.add(facts);
  }

  @override
  void dispose() {
    _streamController.close();
  }


}