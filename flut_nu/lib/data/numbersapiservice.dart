
import 'package:chopper/chopper.dart';
import 'package:flutnu/data/numbersmodel.dart';
import 'package:flutnu/screens/cardspage.dart';

part 'numbersapiservice.chopper.dart';
/* $ flutter.bat packages pub run build_runner build */

/* api endpoint : http://numbersapi.com/random/?json */
@ChopperApi(baseUrl: "random/?json")
abstract class NumbersApiService extends ChopperService {

  @Get()
  Future<Response> getNumbers();

  static NumbersApiService create() {
    final client = ChopperClient(
      baseUrl: "http://numbersapi.com/",
      services: [ _$NumbersApiService() ],
      converter: JsonConverter()
    );
    return _$NumbersApiService(client);
  }
}