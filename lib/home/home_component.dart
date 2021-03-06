import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import '../classes/user.dart';
import '../services/fire_service.dart';

@Component(
    selector: 'home',
    templateUrl: 'home_component.html',
    styleUrls: const ['home_component.css'],
    directives: const [materialDirectives],
    providers: const [materialProviders])
class HomeComponent {
  final FireService _fireService;
  User user = new User();
  String error = "";
  bool hasError = false;
  HomeComponent(this._fireService);

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
