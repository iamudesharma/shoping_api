// import 'package:dart_appwrite/dart_appwrite.dart';
import 'dart:async';

import 'package:dart_appwrite/dart_appwrite.dart' as app;
import 'package:dart_frog/dart_frog.dart';

import '../services/client.dart';

FutureOr<Response> onRequest(RequestContext context) async {
  final acconts = context.read<app.Users>();

  final body = await context.request.json();

  final user = await acconts.create(
    userId: app.ID.unique(),
    email: body.entries.first.value.toString(),
    name: body['name'].toString(),
    password: body.entries.elementAt(1).value.toString(),
    phone: body['phone'].toString(),
  );

  print(user.toMap());

  if (user != null) {
    return Response.json(body: user.toMap());
  }
  return Response.json(
    statusCode: 404,
    body: {
      "message": "Not Found",
    },
  );
}
