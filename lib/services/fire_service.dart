import '../classes/workout.dart';
import 'dart:async';
import 'dart:html';
import 'package:angular2/core.dart';
import 'package:firebase3/firebase.dart' as fb;

@Injectable()
class FireService {
  fb.Auth _fbAuth;
  fb.GoogleAuthProvider _fbGoogleAuthProvider;
  fb.Database _fbDatabase;
  fb.Storage _fbStorage;
  fb.DatabaseReference _fbRefWorkouts;
  fb.User user;
  List<Workout> Workouts = new List<Workout>();

  FireService() {
    try {
      fb.initializeApp(
          apiKey: "AIzaSyBcZQ1Un5PXL7ppgxJ5zi0KzdfE-WNb6Jc",
          authDomain: "climbr-c6796.firebaseapp.com",
          databaseURL: "https://climbr-c6796.firebaseio.com",
          storageBucket: "climbr-c6796.appspot.com");
    } catch (e) {
      window.console.error(e);
    }

    _fbGoogleAuthProvider = new fb.GoogleAuthProvider();
    _fbAuth = fb.auth();
    //_fbAuth.onAuthStateChanged.listen(_authChanged);
    _fbDatabase = fb.database();
    //_fbStorage = fb.storage();
    _fbRefWorkouts = _fbDatabase.ref("Workouts");
    _fbRefWorkouts.onChildAdded.listen(newWorkout);
    _fbRefWorkouts.onChildChanged.listen(changedWorkout);
  }

  void _authChanged(fb.AuthEvent event) {
    user = event.user;
    if (user != null) {
      Workouts = new List<Workout>();
      _fbRefWorkouts.limitToLast(12).onChildAdded.listen(newWorkout);
    }
  }

  Future signIn() async {
    try {
      await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
    } catch (error) {
      print("$runtimeType::login() -- $error");
    }
  }

  void signOut() {
    _fbAuth.signOut();
  }

  void newWorkout(fb.QueryEvent event) {
    Workout workout = new Workout.fromMap(event.snapshot.val());
    Workouts.add(workout);
  }

  void changedWorkout(fb.QueryEvent event) {
    Workout workout = new Workout.fromMap(event.snapshot.val());
    var idx = Workouts.indexOf(Workouts.firstWhere((a)=> a.Id == workout.Id));
    Workouts[idx] = workout;
  }

  List<Workout> GetWorkoutsList() {
    return Workouts;
  }

  Future sendWorkout({String text, String imageURL}) async {
    try {
      Workout workout = new Workout("NOwy test", 12, "caly", "swiat", "taka sobie");
      await _fbRefWorkouts.push(workout.toMap());
    } catch (error) {
      print("$runtimeType::sendMessage() -- $error");
    }
  }
}
