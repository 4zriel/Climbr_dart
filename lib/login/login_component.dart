import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import '../classes/user.dart';
import '../services/fire_service.dart';

@Component(
    selector: 'login',
    templateUrl: 'login_component.html',
    directives: const [materialDirectives],
    providers: const [materialProviders])
class LoginComponent {
  final FireService _fireService;
  User user = new User();
  String error = "";
  bool hasError = false;
  LoginComponent(this._fireService);

  Future CreateUser() async {
    try {
      _fireService.CreateUser(user);
    } catch (e) {
      hasError = true;
      error = e;
    }
  }

  Future SignIn() async {
    try {
      _fireService.signInWithMail(user.Email, user.Password);
    } catch (e) {
      hasError = true;
      error = e;
    }
  }
}
