import 'package:auduyurucu/models/duyuru_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class MainProvider with ChangeNotifier {
  final url = Uri.parse('http://comp.eng.ankara.edu.tr/category/duyuru/');
  final String duyuruSection = 'fusion-posts-container fusion-blog-layout-medium-alternate fusion-blog-pagination fusion-blog-rollover';

  List<DuyuruModel> duyurular = [];

  void getDuyuru() async {
    http.Response response = await http.get(url);
    if (response.statusCode != 200) {
      throw 'Response status code ${response.statusCode}';
    }

    final body = response.body;
    final document = parser.parse(body);
    var elements = document.getElementsByClassName(duyuruSection)[0].children;

    for (var element in elements) {
      int day = int.parse(element.getElementsByClassName('fusion-date')[0].text);
      final monthYear = element.getElementsByClassName('fusion-month-year')[0].text.split(',');
      int month = int.parse(monthYear[0]);
      int year = int.parse(monthYear[1]);
      var post = element.getElementsByClassName('fusion-post-content post-content')[0].children;
      final String title = post[0].text;
      final String text = post[2].text;
      final String url = element.getElementsByClassName('fusion-alignright')[0].children[0].attributes['href'].toString();
      DuyuruModel duyuru = DuyuruModel(title: title, day: day, month: month, year: year, text: text, url: url);
      duyurular.add(duyuru);
    }
    notifyListeners();
  }
}
