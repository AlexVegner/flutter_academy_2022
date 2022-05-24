import 'package:dio/dio.dart';
import 'package:net_neo/models/near_earth_objects.dart';

class NeoService {
  Future<NearNarthObjects?> getNeo() async {
    final response = await Dio().get(
        'https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=DEMO_KEY',
        options: Options(headers: {
          'Authorization': 'Bearer <token>',
          'Content-Type': 'application/json',
        }));

    if (response.statusCode == 200) {
      final rawJson = response.data;
      return NearNarthObjects.fromNasaJson(rawJson);
    }

    return null;
  }
}


// https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=DEMO_KEYv