import 'package:edu_simple_server/router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_plus/shelf_plus.dart';

void main(List<String> args) async {
  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(buildRouter());
  var server = await shelf_io.serve(handler, 'localhost', 8080);

  // Enable content compression
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}
