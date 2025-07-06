import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> _login() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/auth/login/'),
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );
    if (response.statusCode == 200) {
      // Handle success, e.g. save token
    }
  }

  Future<void> _googleLogin() async {
    final account = await _googleSignIn.signIn();
    if (account == null) return;
    final auth = await account.authentication;
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/auth/google/'),
      body: jsonEncode({'access_token': auth.accessToken}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // Handle success
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _googleLogin,
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
