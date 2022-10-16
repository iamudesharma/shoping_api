import 'package:dart_appwrite/dart_appwrite.dart';

import 'package:riverpod/riverpod.dart';

import '../contants/app_contants.dart';

class Dependency {
  static Client get client => _clientProvider;
  static Databases get database => _databaseProvider;
  static Account get account => _accountProvider;
  static Users get users => _usersProvider;

  // static Provider<Realtime> get realtime => _realtimeProvider;
//
  // static Provider<SharedPreferences?> get localStorage => _localStorage;
}

// abstract class Repository {
//   static Provider<AuthRepo> get auth => AuthRepo.provider;
//   static Provider<SharedPreferences?> get localStorage =>
//       Dependency.localStorage;
//   // static Provider<ProductRepo> get database => ProductRepo.provider;

//   static Provider<ProductRepo> get database => ProductRepo.provider;

//   // static Provider<DatabaseRepository> get database =>
//   // DatabaseRepository.provider;
// }

// final _localStorage = Provider<SharedPreferences?>(
//   (ref) => null,
// );
final _clientProvider = Client()
  ..setProject(PROJECT_ID)
  ..setEndpoint(PROJECT_URL)
  ..setKey(
      PROJECT_API_KEY);

final _databaseProvider = Databases(_clientProvider);

final _accountProvider = Account(_clientProvider);

final _usersProvider = Users(_clientProvider);
// final _realtimeProvider = Provider(
//   (ref) => Realtime(ref.read(_clientProvider)),
// );
