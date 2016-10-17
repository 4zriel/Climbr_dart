import '../classes/tab.dart';
import '../services/fire_service.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(selector: 'navbar', templateUrl: 'navbar_component.html')
class NavbarComponent implements OnInit {
  final List<Tab> Links = [
    new Tab('Workouts', 'directions_run', 'Workouts'),
    new Tab('Statistics', 'equalizer', 'Statistics'),
    new Tab('Profile', 'account_circle', 'Profile'),
    new Tab('Home', 'home', 'Home'),
  ];

  final Router _router;
  final FireService fireService;

  NavbarComponent(this._router, this.fireService);

  void ngOnInit() {}

  void goToLink(Tab link) {
    _router.navigate([link.Link, {}]);
  }
}
