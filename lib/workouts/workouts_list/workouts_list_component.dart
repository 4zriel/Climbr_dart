import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';

import '../../classes/workout.dart';
import '../../services/fire_service.dart';

@Component(
    selector: 'workouts-list',
    templateUrl: 'workouts_list_component.html',
    styles: const ['workouts_list_component.css'],
    directives: const [materialDirectives],
    providers: const [materialProviders])
class WorkoutsListComponent {
  final FireService _fireService;
  final Router _router;
  List<Workout> WorkoutsList = new List<Workout>();
  String test = "JAJCO";
  bool inProgress = true;

  WorkoutsListComponent(this._fireService, this._router) {
    getWorkouts();
  }

  void onSelect(Workout w) {
    window.console.info(w.toString());
  }

  void add() {
    _fireService.sendWorkout();
  }

  void Edit(Workout w) {
    _router.navigate([
      '../Workout',
      {'id': w.Id}
    ]);
  }

  Future getWorkouts() async {
    WorkoutsList = await _fireService.GetWorkoutsList();
    inProgress = false;
  }
}
