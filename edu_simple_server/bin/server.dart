import 'package:edu_simple_server/router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
// import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  // Router app = Router(notFoundHandler: _echoRequest);
  // Router v1 = Router();
  // app.mount('/v1', v1);
  // v1.get('/ping', _v1Ping);

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(buildRouter());
  var server = await shelf_io.serve(handler, 'localhost', 8080);

  // Enable content compression
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

// Response _echoRequest(Request request) =>
//     Response.ok('Request for "${request.url}"');

// Response _v1Ping(Request request) => Response.ok('Ping "${request.url}"');
