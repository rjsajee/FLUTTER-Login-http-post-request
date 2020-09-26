import 'package:flutter/material.dart';
import 'package:login_http/model/login_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  LoginRequestModel requestModel;

  @override
  void initState() { 
    super.initState();
    requestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.2),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      )
                    ]),
                child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text("Login",
                            style: Theme.of(context).textTheme.headline2),
                        SizedBox(height: 25),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.email= input,
                          validator: (input) => !input.contains("@")
                              ? "Email id should be valid"
                              : null,
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            )),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => requestModel.password = input,
                          validator: (input) => input.length < 3
                              ? "Password Should be more than 3 Characters"
                              : null,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            )),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Theme.of(context).accentColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.4),
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        FlatButton(
                          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                          onPressed: (){
                            if(validateAndSave()){
                              print(requestModel.toJson());
                            }
                          },
                          child: Text("Login", style: TextStyle(color: Colors.white),),
                          color: Colors.redAccent,
                          shape: StadiumBorder(),
                          ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      )),
    );
  }
  bool validateAndSave(){
    final form = globalFormKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }
}
