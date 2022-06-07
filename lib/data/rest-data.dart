import '../users.dart';
import 'database-helper.dart';

class RestData {
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String email, String password) async {
    //simulate internet connection by selecting the local database to check if user has already been registered
    String flagLogged = "logged";
    var user = new User(null, email, password, null);
    var db = new DatabaseHelper();
    User? userRetorno = new User(null, null, null, null);
    userRetorno = await db.selectUser(user);
    if (userRetorno != null) {
      flagLogged = "logged";
      return new Future.value(new User(null, email, password, flagLogged));
    } else {
      flagLogged = "not";
      return new Future.value(new User(null, email, password, flagLogged));
    }
  }
}
