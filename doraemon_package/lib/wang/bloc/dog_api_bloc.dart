import 'dart:async';
import 'dart:convert' show json, jsonDecode, utf8;
import 'dart:io';
import 'package:bloc/bloc.dart';

class DogApiBloc extends Bloc<DogApiRequest, DogMessage> {
  @override
  DogMessage get initialState => DogMessage();

  @override
  Stream<DogMessage> mapEventToState(DogApiRequest event) async* {
    var url = 'https://dog-api.kinduff.com/api/facts';
    var httpClient = new HttpClient();
    DogMessage dogMessage = new DogMessage();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        if(data['success']) {
          var facts = data['facts'];
          dogMessage.content = facts[0];
        }

      }
    } catch (exception) {

    }
    yield dogMessage;
  }
}

class DogApiRequest {}

class DogMessage {
  String content = "Wang !";
}
