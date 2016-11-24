import 'dart:async';

import 'dart:html';
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
  final FireService fireService;
  User user = new User();
  String error = "";
  bool hasError = false;
  bool createNew = false;
  String password2 = "";
  LoginComponent(this.fireService);

  Future CreateUser() async {
    try {
      fireService.CreateUser(user);
    } catch (e) {
      hasError = true;
      error = e;
    }
  }

  Future SignIn() async {
    try {
      fireService.signInWithMail(user.Email, user.Password);
    } catch (e) {
      hasError = true;
      error = e;
    }
  }
}
