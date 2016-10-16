import 'dart:html';
import 'package:Climbr_dart/classes/workout.dart';
import 'package:Climbr_dart/services/fire_service.dart';
import 'package:angular2/core.dart';
import 'package:angular2/angular2.dart';

@Component(
    selector: 'workouts-list', templateUrl: 'workouts_list_component.html')
class WorkoutsListComponent {
  final FireService _fireService;
  List<Workout> WorkoutsList = new List<Workout>();
  String test = "JAJCO";

  WorkoutsListComponent(this._fireService) {
    WorkoutsList = _fireService.GetWorkoutsList();
    // getWorkouts();
  }

  void onSelect(Workout w) {
    window.console.error(w.toString());
  }

  void add(){
    _fireService.sendWorkout();
  }

  // Future getWorkouts() async {
  //   this.WorkoutList = _fireService.Workouts;
  //   this.WorkoutList = _fireService.GetWorkoutsList();
  // }
}
