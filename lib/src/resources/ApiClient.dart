
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ApiClient {

  final API_KEY = "";
  static final  _URL = "http://numbersapi.com";

  static Future<String>  getFacts (String numberString) async{


    Future.delayed(Duration(seconds: 2));
    final response = await http.get("$_URL/$numberString");

    if(response.statusCode != 200)
      return Future.error("Error");

    return response.body;

  }

  static Future<bool> isConnected() async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
        return false;
    }
    return false;
  }
}