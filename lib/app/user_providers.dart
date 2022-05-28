import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_doc/app/constants.dart';
import 'package:dart_appwrite/dart_appwrite.dart' hide Database;

abstract class UserDependency {
  static Provider<Client> get client => _clientProvider;
  static Provider<Users> get database => _userProvider;

}

final _clientProvider = Provider<Client>(
  (ref) => Client()
    ..setProject(appwriteProjectId)
    ..setSelfSigned(status: true)
    ..setEndpoint(appwriteEndpoint)
    ..setKey(usersearchKey),
);

final _userProvider =
    Provider<Users>((ref) => Users(ref.read(_clientProvider)));

