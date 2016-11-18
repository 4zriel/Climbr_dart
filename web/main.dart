import 'package:angular2/core.dart' show provide;
import 'package:angular2/platform/browser.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';
import '../lib/app_component.dart';

main() async {
  await initPolymer();
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
