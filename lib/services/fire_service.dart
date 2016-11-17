import 'dart:async';
import 'dart:html';

import 'package:angular2/core.dart';
import 'package:firebase3/firebase.dart' as fb;

import '../classes/user.dart';
import '../classes/workout.dart';

@Injectable()
class FireService {
  fb.Auth _fbAuth;
  fb.GoogleAuthProvider _fbGoogleAuthProvider;
  fb.Database _fbDatabase;
  //fb.Storage _fbStorage;
  fb.DatabaseReference _fbRefWorkouts;
  fb.DatabaseReference _fbRefUsers;
  fb.User user;
  List<Workout> workouts = new List<Workout>();

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
    _fbAuth.onAuthStateChanged.listen(_authChanged);
    _fbDatabase = fb.database();

    //_fbStorage = fb.storage();
    _fbRefWorkouts = _fbDatabase.ref("Workouts");
    _fbRefUsers = _fbDatabase.ref("Users");
    if (user != null) {
      setupDb();
    }
  }

  void setupDb() {
    _fbRefWorkouts.onChildAdded.listen(newWorkout);
    _fbRefWorkouts.onChildChanged.listen(changedWorkout);
  }

  void _authChanged(fb.AuthEvent event) {
    user = event.user;
    if (user != null && !user.emailVerified) {
      user = null;
      fb.auth().signOut();
    }
    if (user != null) {
      workouts = new List<Workout>();
      setupDb();
      //_fbRefWorkouts.onChildAdded.listen(newWorkout);
    }
  }

  Future signIn() async {
    try {
      await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
    } catch (error) {
      print("$runtimeType::login() -- $error");
    }
  }

  Future signInWithMail(email, password) async {
    await _fbAuth.signInWithEmailAndPassword(email, password);
  }

  Future CreateUser(User formUser) async {
    try {
      await _fbAuth
          .createUserWithEmailAndPassword(formUser.Email, formUser.Password)
          .then((user) => AddUserToDB(user, formUser))
          .catchError((e) => throw new Exception(e));
    } catch (e) {}
  }

  void signOut() {
    _fbAuth.signOut();
  }

  void AddUserToDB(fb.User user, User formUser) {
    user.sendEmailVerification();
    User newUser = new User();
    newUser.UID = user.uid;
    newUser.Email = user.email;
    if (user.displayName == null || user.displayName.isEmpty)
      newUser.Name = formUser.Name;
    else
      newUser.Name = user.displayName;
    newUser.PrividerId = user.providerId;
    newUser.PhotoUrl = user.photoURL;
    newUser.RefreshToken = user.refreshToken;
    try {
      _fbRefUsers.push(newUser.toMap());
    } catch (e) {
      window.console.log(e);
    }
  }

  void newWorkout(fb.QueryEvent event) {
    fb.DataSnapshot data = event.snapshot;
    var val = data.val();
    Workout workout = new Workout.fromMap(val, data.key);
    workouts.add(workout);
  }

  void changedWorkout(fb.QueryEvent event) {
    Workout workout =
        new Workout.fromMap(event.snapshot.val(), event.snapshot.key);
    var idx = workouts.indexOf(workouts.firstWhere((a) => a.Id == workout.Id));
    workouts[idx] = workout;
  }

  Future GetWorkoutsList() async {
    return (await workouts);
  }

  Future sendWorkout({String text, String imageURL}) async {
    try {
      Workout workout =
          new Workout("NOwy test", 12, "caly", "swiat", "taka sobie");
      await _fbRefWorkouts.push(workout.toMap());
    } catch (error) {
      print("$runtimeType::sendMessage() -- $error");
    }
  }

  Future saveWorkout(Workout w) async {
    try {
      window.console.log(w.Key);
      await _fbRefWorkouts.child(w.Key).update(w.toMap());
    } catch (error) {
      print("$runtimeType::sendMessage() -- $error");
    }
  }
}
