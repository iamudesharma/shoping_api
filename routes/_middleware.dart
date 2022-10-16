import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_frog/dart_frog.dart';

import '../services/client.dart';

// Handler middleware(Handler handler) {
//   return handler.use(requestLogger());
// }

Handler middleware(Handler handler) {
  return handler
      .use(provider<Client>((context) => Dependency.client))
      .use(provider<Users>((context) => Dependency.users))
      .use(provider<Account>((context) => Dependency.account))
      .use(provider<Databases>((context) => Dependency.database));
}
