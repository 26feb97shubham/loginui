import 'package:flutter/material.dart';
import 'package:loginui/users.dart';

import 'data/database-helper.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isRememberMe = false;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  late String _username, _email, _pass, _cnfrmpass;

  DateTime pre_backpress = DateTime.now();
  bool _isLoading = false;

  _showSnackbar() {
    var snackBar = new SnackBar(content: Text("Sign Up Successful"));

    scaffoldKey.currentState!.showSnackBar(snackBar);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ),
    );
  }

  Widget buildUserName() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Username",
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
                controller: username,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black87),
                onSaved: (val) => _username = val!,
                validator: (val) => val!.length < 6
                    ? "Username length should be Greater than 6"
                    : null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xffe58210),
                    ),
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.black38)),
              ))
        ]);
  }

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
              validator: (val) {
                if (val!.isEmpty) {
                  return "Required";
                }
                if (val.length < 6) {
                  return "Confirm Password must be atleast 6 characters long";
                }
                if (val.length > 20) {
                  return "Confirm Password must be less than 20 characters";
                }
                if (!val.contains(RegExp(r'[0-9]'))) {
                  return "Password must contain a number";
                }
              },
              onSaved: (val) => _pass = val!,
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

  Widget buildConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Confirm Password",
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
              controller: confirmpassword,
              obscureText: true,
              style: TextStyle(color: Colors.black87),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Required";
                }
                if (val.length < 6) {
                  return "Confirm Password must be atleast 6 characters long";
                }
                if (val.length > 20) {
                  return "Confirm Password must be less than 20 characters";
                }
                if (!val.contains(RegExp(r'[0-9]'))) {
                  return "Password must contain a number";
                }
                /* if (!val.contains(_pass!, 0)) {
                  return "Password does not match";
                }*/
              },
              onSaved: (val) => _cnfrmpass = val!,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xffe58210),
                  ),
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(color: Colors.black38))),
        )
      ],
    );
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

  Widget buildSignUpButton() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5,
          onPressed: () {
            /*if (formKey.currentState!.validate()) {
              formKey.currentState!.save();

              final user = User(1, username.text.toString(),
                  email.text.toString(), password.text.toString());
              _showSnackbar();
            }*/
            _submit();
          },
          padding: EdgeInsets.all(30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: const Color(0xffe58210),
          child: const Text(
            "SIGN UP",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildLoginButton() {
    return GestureDetector(
      onTap: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      ),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: 'LOG IN ',
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
    return Scaffold(
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
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      buildUserName(),
                      const SizedBox(height: 50),
                      buildEmail(),
                      const SizedBox(height: 20),
                      buildPassword(),
                      const SizedBox(height: 20),
                      buildConfirmPassword(),
                      const SizedBox(height: 20),
                      buildSignUpButton(),
                      buildLoginButton()
                    ],
                  )),
            )
          ]))),
    );
  }

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        var user = new User(_username, _email, _pass, null);
        var db = new DatabaseHelper();
        db.saveUser(user);
        _isLoading = false;
        // Navigator.of(context).pushNamed("/login");
      });
    }
  }
}
