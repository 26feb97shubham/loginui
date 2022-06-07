import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginui/home.dart';
import 'package:loginui/signUp.dart';
import 'package:loginui/users.dart';

import 'login_presenter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginScreenState extends State<LoginScreen>
    implements LoginPageContract {
  BuildContext? _ctx;
  bool isRememberMe = false;
  bool _isLoading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String? _email, _pass;

  DateTime pre_backpress = DateTime.now();

  String? _username, _password;

  late List<User> users;
  bool isLoading = false;

  LoginPagePresenter? _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState?.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _submit() {
    final form = formKey.currentState;

    /*if (form!.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter!.doLogin(_email!, _password!);
      });
    }*/
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Home(),
      ),
    );
  }

  var value;

  Widget buildEmail() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Email",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ]),
              height: 60,
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black87),
                validator: (val) =>
                    !val!.contains("@") ? "Email Id is not Valid" : null,
                onSaved: (val) => _email = val!,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(
                      Icons.email_sharp,
                      color: Color(0xffe58210),
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.black38)),
              ))
        ]);
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Password",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
              controller: password,
              obscureText: true,
              style: TextStyle(color: Colors.black87),
              onSaved: (val) => _pass = val!,
              validator: (val) => val!.length < 6
                  ? "Password length should be Greater than 6"
                  : null,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xffe58210),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.black38))),
        )
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
          onPressed: () => print("Forgot Password"),
          padding: EdgeInsets.only(right: 0),
          child: Text(
            "Forgot Password?",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildRememberCb() {
    return Container(
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (bool? value) {
                  setState(() {
                    isRememberMe = value!;
                  });
                },
              ),
            ),
            Text(
              "Remember Me",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget buildLoginButton() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5,
          onPressed: () {
/*            if (formKey.currentState!.validate()) {
              setState(() {
                _isLoading = true;
                formKey.currentState!.save();
                for (int i = 0; i < users.length; i++) {
                  if (users[i].email == _email) {
                    if (users[i].password == _pass) {
                      _showSnackBar("Login Successful");
                    } else {
                      _showSnackBar("Password doesnot match");
                    }
                  } else {
                    _showSnackBar("Email doesnot match");
                  }
                }
              });
            }*/
            _submit();
          },
          padding: EdgeInsets.all(30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: const Color(0xffe58210),
          child: const Text(
            "LOGIN",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildSignUpButton() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        ),
      ),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: 'Sign Up ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          key: scaffoldKey,
          body: Form(
              key: formKey,
              child: GestureDetector(
                  child: Stack(children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color(0x66e58210),
                        Color(0x99e58210),
                        Color(0xcce58210),
                        Color(0xffe58210)
                      ])),
                  child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 50),
                          buildEmail(),
                          const SizedBox(height: 20),
                          buildPassword(),
                          const SizedBox(height: 20),
                          buildForgotPassBtn(),
                          const SizedBox(height: 20),
                          buildLoginButton(),
                          buildSignUpButton()
                        ],
                      )),
                )
              ]))),
        ),
        onWillPop: () async {
          final timegap = DateTime.now().difference(pre_backpress);
          final cantExit = timegap >= Duration(seconds: 2);
          pre_backpress = DateTime.now();
          if (cantExit) {
            //show snackbar
            final snack = SnackBar(
              content: Text('Press Back button again to Exit'),
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false;
          } else {
            return true;
          }
        });
  }

  @override
  void onLoginError(String error) {
    _showSnackBar("Login not successful");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async {
    if (user.email == "") {
      _showSnackBar("Login not successful");
    } else {
      _showSnackBar(user.toString());
    }
    setState(() {
      _isLoading = false;
    });
    if (user.flaglogged == "logged") {
      print("Logged");
      // Navigator.of(context).pushNamed("/home");
    } else {
      print("Not Logged");
    }
  }
}
