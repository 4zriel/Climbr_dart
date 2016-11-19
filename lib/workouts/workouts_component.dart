import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'workout_detail/workout_detail_compontent.dart';
import 'workouts_list/workouts_list_component.dart';

@Component(
    selector: 'workouts',
    templateUrl: 'workouts_component.html',
    directives: const [ROUTER_DIRECTIVES])
@RouteConfig(const [
  const Route(
      path: '/list',
      name: 'List',
      component: WorkoutsListComponent,
      useAsDefault: true),
  const Route(
      path: '/workout/:id', name: 'Workout', component: WorkoutDetailComponent)
])
class WorkoutsComponent {
  WorkoutsComponent();
}
