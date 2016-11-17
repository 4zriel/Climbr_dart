import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';

import 'footer/footer_component.dart';
import 'home/home_component.dart';
import 'navbar/navbar_component.dart';
import 'profile/profile_component.dart';
import 'login/login_component.dart';
import 'services/fire_service.dart';
import 'statistics/statistic_component.dart';
import 'workouts/workouts_component.dart';

@Component(
    selector: 'app-root',
    styleUrls: const ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: const [NavbarComponent, FooterComponent, ROUTER_DIRECTIVES],
    providers: const [
      const Provider(LocationStrategy, useClass: HashLocationStrategy),
      FireService
    ])
@RouteConfig(const [
  const Route(path: '/', name: 'Home', component: HomeComponent),
  const Route(path: '/home', name: 'Home', component: HomeComponent),
  const Route(path: '/profile', name: 'Profile', component: ProfileComponent),
  const Route(
      path: '/statistics', name: 'Statistics', component: StatisticsComponent),
  const Route(
      path: '/workouts/...', name: 'Workouts', component: WorkoutsComponent),
  const Route(
      path: '/login',
      name: 'Login',
      component: LoginComponent,
      useAsDefault: true)
])
class AppComponent {
  final FireService _fireService;
  AppComponent(this._fireService);
}
