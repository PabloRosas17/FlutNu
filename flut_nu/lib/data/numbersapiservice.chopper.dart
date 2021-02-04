// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numbersapiservice.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$NumbersApiService extends NumbersApiService {
  _$NumbersApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = NumbersApiService;

  Future<Response> getNumbers() {
    final $url = 'random/?json';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
