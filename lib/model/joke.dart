import 'package:intl/intl.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class Joke {
  DateTime dateTime;
  String text;
  String category;

  Joke(DateTime dateTime, String text, String category) {
    this.dateTime = dateTime;
    this.text = text;
    this.category = category;
  }
}

class RandomJokeBuilder {

  final String _siteUrl = "https://www.anekdot.ru/random/anekdot/";

  Future<List<Joke>> getRandomJokes() async {
    final response = await http.Client().get(Uri.parse(_siteUrl));

    List<Joke> randomJokes = [];

    if(response.statusCode == 200) {
      var document = parse(response.body.replaceAll('<br>', '\n'));
      var listJokes = document.getElementsByClassName("content content-min")[0].children[0];

      for(int i = 1; i < 10; i++) {
        try{
        randomJokes.add(new Joke(
            DateFormat('dd.MM.yyyy').parse(listJokes.children[i].children[0].text),
            listJokes.children[i].children[1].text,
            listJokes.children[i].children[2].text));
        }catch(FormatException) {

        }
      }

    } else {
      throw Exception();
    }

    return randomJokes;
  }
}
