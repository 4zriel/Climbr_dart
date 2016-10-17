import '../../classes/workout.dart';
import '../../services/fire_service.dart';
import 'dart:async';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
    selector: 'workout-detail', templateUrl: 'workout_detail_compontent.html')
class WorkoutDetailComponent {
  Workout workoutDetail;
  final RouteParams _routeParams;
  final FireService _fireService;
  WorkoutDetailComponent(this._fireService, this._routeParams) {
    getWorkout();
  }
  Future<Null> getWorkout() async {
    var id = _routeParams.get('id');
    workoutDetail = await (_fireService.Workouts.firstWhere((a) => a.Id == id));
  }
}
