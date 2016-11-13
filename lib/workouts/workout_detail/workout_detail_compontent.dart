import '../../classes/workout.dart';
import '../../services/fire_service.dart';
import 'dart:async';
import 'dart:html';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
    selector: 'workout-detail',
    templateUrl: 'workout_detail_compontent.html',
    directives: const [materialDirectives],
    providers: const [materialProviders])
class WorkoutDetailComponent {
  Workout workoutDetail;
  final RouteParams _routeParams;
  final FireService _fireService;

  WorkoutDetailComponent(this._fireService, this._routeParams) {
    getWorkout();
  }
  Future<Null> getWorkout() async {
    var id = _routeParams.get('id');
    workoutDetail = await (_fireService.workouts.firstWhere((a) => a.Id == id));
    window.console.log(workoutDetail);
  }

  Future saveWorkout() async {
    try {
      await _fireService.saveWorkout(workoutDetail);
    } catch (e) {
      print(e);
    }
    window.history.back();
  }

  void cancel(){
    window.history.back();
  }
}
