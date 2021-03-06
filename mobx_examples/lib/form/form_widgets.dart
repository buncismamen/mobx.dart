import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_examples/form/form_store.dart';

class FormExample extends StatefulWidget {
  const FormExample();

  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final FormStore store = FormStore();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Observer(
                builder: (_) => TextField(
                      onChanged: store.setUsername,
                      decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Pick a username',
                          errorText: store.error.username),
                    ),
              ),
              Observer(
                  builder: (_) => AnimatedOpacity(
                      child: const LinearProgressIndicator(),
                      duration: Duration(milliseconds: 300),
                      opacity: store.isUserCheckPending ? 1 : 0)),
              Observer(
                builder: (_) => TextField(
                      onChanged: store.setEmail,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email address',
                          errorText: store.error.email),
                    ),
              ),
              Observer(
                builder: (_) => TextField(
                      onChanged: store.setPassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Set a password',
                          errorText: store.error.password),
                    ),
              ),
              RaisedButton(
                child: const Text('Sign up'),
                onPressed: store.validateAll,
              )
            ],
          ),
        ),
      ));
}
