import 'package:google_doc/app/navigation/transition_page.dart';
import 'package:google_doc/components/auth/auth.dart';
import 'package:routemaster/routemaster.dart';

// import 'package:google_doc/components/document/document.dart';

const _login = '/login';
const _register = '/register';
const _document = '/document';
const _newDocument = '/newDocument';

abstract class AppRoutes {
  static String get document => _document;
  static String get newDocument => _newDocument;
  static String get login => _login;
  static String get register => _register;
}

final routesLoggedOut = RouteMap(
  onUnknownRoute: (_) => const Redirect(_login),
  routes: {
    _login: (_) => const TransitionPage1(
          child: LoginPage(),
        ),
    _register: (_) => const TransitionPage1(
          child: RegisterPage(),
        ),
  },
);

