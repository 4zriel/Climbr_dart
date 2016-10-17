import '../../classes/workout.dart';
import '../../services/fire_service.dart';
import 'dart:async';
import 'dart:html';
import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'workouts-list',
    templateUrl: 'workouts_list_component.html',
    styles: const ['workouts_list_component.css'])
class WorkoutsListComponent {
  final FireService _fireService;
  final Router _router;
  List<Workout> WorkoutsList = new List<Workout>();
  String test = "JAJCO";

  WorkoutsListComponent(this._fireService, this._router) {
    WorkoutsList = _fireService.GetWorkoutsList();
    // getWorkouts();
  }

  void onSelect(Workout w) {
    window.console.info(w.toString());
  }

  void add() {
    _fireService.sendWorkout();
  }

  void Edit(Workout w){
    _router.navigate(['../Workout',{'id': w.Id}]);
  }

  Future getWorkouts() async {
    WorkoutsList = _fireService.Workouts;
    WorkoutsList = _fireService.GetWorkoutsList();
  }
}
