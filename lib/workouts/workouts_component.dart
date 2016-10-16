import 'package:Climbr_dart/workouts/workout_detail/workout_detail_compontent.dart';
import 'package:Climbr_dart/workouts/workouts_list/workouts_list_component.dart';
import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

@Component(
  selector: 'workouts',
  templateUrl: 'workouts_component.html',
  directives: const [ROUTER_DIRECTIVES]
)
@RouteConfig(const [
  const Route(
      path: '/list',
      name: 'List',
      component: WorkoutsListComponent,
      useAsDefault: true),
  const Route(
      path: '/workout', name: 'Workout', component: WorkoutDetailComponent)
])
class WorkoutsComponent {
  WorkoutsComponent();
}
