import 'package:flutter/material.dart';

import '../helper/ApiResponse.dart';
import '../model/client.dart';
import '../services/ClientService.dart';




class AddClientPage extends StatefulWidget {
  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  String error = "";
  final http = ClientService();
  late ApiResponse<dynamic> _apiResponse;
  late TextEditingController _nomController;
  late TextEditingController _emailController;
  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late TextEditingController _sexeController;

  String errorMessage = "";
  final List<String> errors = [];
  bool _isObscure = true;

  void addError({var error}) {
    if (!errors.contains(error))
      setState(() {
        errorMessage = error;
        errors.add(error);
      });
  }

  void removeError({var error}) {
    if (errors.contains(error))
      setState(() {
        errorMessage = "";
        errors.clear();
      });
  }

  @override
  void initState() {
    super.initState();
    errorMessage = "";
    _nomController = TextEditingController();
    _emailController = TextEditingController();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _sexeController = TextEditingController();
  }

  clearTextField() {
    _nomController.clear();
    _emailController.clear();
    _loginController.clear();
    _passwordController.clear();
    _sexeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un client'),
        backgroundColor: Color(0xFF00A368),
      ),
      body: Form(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      " Entrez le nom",
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                    Text(
                      errorMessage,
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.red),
                    ),
                    buildNomFormField(),
                    //CustomTextInput(
                    //  hintText: "Your email",
                    // ),

                    Text(
                      " Entrez le login",
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                    Text(
                      errorMessage,
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.red),
                    ),
                    buildLoginFormField(),
                    //CustomTextInput(
                    //  hintText: "Your email",
                    // ),

                    Text(
                      " Entrez le mot de passe",
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                    buildPasswordFormField(),
                    //CustomTextInput(
                    //  hintText: "password",
                    // ),

                    Text(
                      " Entrez email",
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                    Text(
                      errorMessage,
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.red),
                    ),
                    buildEmailFormField(),
                    //CustomTextInput(
                    //  hintText: "Your email",
                    // ),

                    Text(
                      " Entrez le sexe",
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                    Text(
                      errorMessage,
                      //errors.isNotEmpty? errors.first: "cdcdcdcd",
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Colors.red),
                    ),
                    buildSexeFormField(),
                    //CustomTextInput(
                    //  hintText: "Your email",
                    // ),

                    // fin formulaire

                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, "ListClientPage");
                      },
                      child: Ink(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              ApiResponse<dynamic> response;
                              Clients monclient = new Clients(
                                  nom: _nomController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  login: _loginController.text,
                                  sexe: _sexeController.text);

                              response = await http.createClient(monclient);
                              setState(() {
                                print(response);
                                _apiResponse = response;
                              });
                              if (_apiResponse.error == false) {
                                setState(() {
                                  _passwordController.text = "";
                                  _nomController.text = "";
                                  _emailController.text = "";
                                  _sexeController.text = "";
                                  _loginController.text = "";
                                });

                                /* Util.connectedUser = _apiResponse.data;
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.routeName);
                            */
                              } else {
                                setState(() {
                                  errorMessage =
                                      "Veuillez entrer des informations valide !!!";
                                });
                              }
                            },
                            child: Text("Enregistrer"),
                            style: ButtonStyle(
                                //backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 35, 128, 81))
                                ),
                          ),
                        ),
                      ),
                    )
                  ]))),
    );
  }

  // construction des inputs

  TextFormField buildPasswordFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: _isObscure,
      onSaved: (newValue) {
        setState(() {
          _passwordController.text = newValue!;
        });
      },
      onTap: () {
        if (_passwordController.text.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer le mot de passe";
          });
          ;
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        }
        if (value.isEmpty) {
          setState(() {
            errorMessage = "Veuillez entrer le mot de passe";
          });
        }
        ;
      },
      validator: (value) {
        bool? estvide = value?.isEmpty;
        if (estvide == false) {
          setState(() {
            errorMessage = "Veuillez entrer le mot de passe";
          });
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        border: new OutlineInputBorder(
            // borderSide: new BorderSide(color: Colors.teal)
            ),
        //labelText: AppLocalizations.of(context)!.pwd,
        suffixIcon: IconButton(
          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        // hintText: "Nom d'utilisateur",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        isDense: true,
      ),
      controller: _passwordController,
    );
  }

  TextFormField buildNomFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) {
        setState(() {
          _nomController.text = newValue!;
        });
      },
      onTap: () {
        if (_nomController.text.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer le nom";
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer le nom ";
          });
        }
      },
      /*validator: (value) {
        if (!value.isEmpty) {
          addError(error: "Nom d'utilisateur invalide");
          return "";
        }
        return null;
      },*/
      decoration: InputDecoration(
        border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF00A368))),
        //labelText: AppLocalizations.of(context)!.login,
        //hintText: "Nom d'utilisateur",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        isDense: true,
      ),
      controller: _nomController,
    );
  }

  TextFormField buildLoginFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) {
        setState(() {
          _loginController.text = newValue!;
        });
      },
      onTap: () {
        if (_nomController.text.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer le login";
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer le login";
          });
        }
      },
      /*validator: (value) {
        if (!value.isEmpty) {
          addError(error: "Nom d'utilisateur invalide");
          return "";
        }
        return null;
      },*/
      decoration: InputDecoration(
        border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF00A368))),
        //labelText: AppLocalizations.of(context)!.login,
        suffixIcon: Icon(Icons.account_circle_sharp),
        //hintText: "Nom d'utilisateur",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        isDense: true,
      ),
      controller: _loginController,
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) {
        setState(() {
          _emailController.text = newValue!;
        });
      },
      onTap: () {
        if (_emailController.text.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer email";
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer email";
          });
        }
      },
      /*validator: (value) {
        if (!value.isEmpty) {
          addError(error: "Nom d'utilisateur invalide");
          return "";
        }
        return null;
      },*/
      decoration: InputDecoration(
        border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF00A368))),
        //labelText: AppLocalizations.of(context)!.login,
        //hintText: "Nom d'utilisateur",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        isDense: true,
      ),
      controller: _emailController,
    );
  }

  TextFormField buildSexeFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) {
        setState(() {
          _sexeController.text = newValue!;
        });
      },
      onTap: () {
        if (_sexeController.text.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer le  sexer";
          });
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage = "";
          });
        } else {
          setState(() {
            errorMessage = "Veuillez entrer le sexe";
          });
        }
      },
      /*validator: (value) {
        if (!value.isEmpty) {
          addError(error: "Nom d'utilisateur invalide");
          return "";
        }
        return null;
      },*/
      decoration: InputDecoration(
        border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF00A368))),
        //labelText: AppLocalizations.of(context)!.login,
        //hintText: "Nom d'utilisateur",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        isDense: true,
      ),
      controller: _sexeController,
    );
  }
  // fin
}
