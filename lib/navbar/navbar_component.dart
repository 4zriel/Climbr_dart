import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';
import '../classes/navtab.dart';
import '../services/fire_service.dart';

@Component(
    selector: 'navbar-component',
    templateUrl: 'navbar_component.html',
    directives: const [materialDirectives],
    providers: const [materialProviders])
class NavbarComponent implements OnInit {
  final List<NavTab> Links = [
    new NavTab('Home', 'home', 'Home'),
    new NavTab('Workouts', 'directions_run', 'Workouts'),
    new NavTab('Statistics', 'equalizer', 'Statistics'),
    new NavTab('Profile', 'account_circle', 'Profile')
  ];

  final Router _router;
  final FireService fireService;

  NavbarComponent(this._router, this.fireService);

  void ngOnInit() {}

  void goToLink(NavTab link) {
    _router.navigate([link.Link, {}]);
  }

  void login(bool logout) {
    if (logout) this.fireService.user = null;
    _router.navigate(['Login', {}]);
  }
}
