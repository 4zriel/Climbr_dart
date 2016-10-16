import 'package:Climbr_dart/classes/workout.dart';
import 'package:Climbr_dart/services/fire_service.dart';
import 'package:angular2/core.dart';

@Component(
    selector: 'workout-detail', templateUrl: 'workout_detail_compontent.html')
class WorkoutDetailComponent {
  Workout WorkoutDetail;
  final FireService _fireService;
  WorkoutDetailComponent(this._fireService){
    WorkoutDetail = _fireService.Workouts.first;
  }
}
