import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InvenTrack',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FrontPage(),
    );
  }
}

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InvenTrack')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Shopkeeper'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ShopkeeperLoginPage()));
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Customer'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CustomerPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ShopkeeperLoginPage extends StatefulWidget {
  const ShopkeeperLoginPage({super.key});

  @override
  State<ShopkeeperLoginPage> createState() => _ShopkeeperLoginPageState();
}

class _ShopkeeperLoginPageState extends State<ShopkeeperLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailMobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMsg = '';

  void login() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString('email') ?? '';
    final storedMobile = prefs.getString('mobile') ?? '';
    final storedPassword = prefs.getString('password') ?? '';

    if ((emailMobileController.text == storedEmail ||
            emailMobileController.text == storedMobile) &&
        passwordController.text == storedPassword) {
      setState(() {
        errorMsg = '';
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login Successful')));
    } else {
      setState(() {
        errorMsg = 'Invalid credentials';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopkeeper Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailMobileController,
                  decoration:
                      const InputDecoration(labelText: 'Email or Mobile Number'),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter email or mobile' : null,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) =>
                      value!.isEmpty ? 'Enter password' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text('Login')),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ShopkeeperSignUpPage()));
                    },
                    child: const Text('Sign Up')),
                const SizedBox(height: 10),
                Text(errorMsg, style: const TextStyle(color: Colors.red)),
                TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Forgot Password Clicked')));
                    },
                    child: const Text('Forgot Password?'))
              ],
            )),
      ),
    );
  }
}

class ShopkeeperSignUpPage extends StatefulWidget {
  const ShopkeeperSignUpPage({super.key});

  @override
  State<ShopkeeperSignUpPage> createState() => _ShopkeeperSignUpPageState();
}

class _ShopkeeperSignUpPageState extends State<ShopkeeperSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String errorMsg = '';

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        errorMsg = 'Passwords do not match';
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('mobile', mobileController.text);
    await prefs.setString('password', passwordController.text);

    setState(() {
      errorMsg = '';
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Sign Up Successful')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopkeeper Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your name' : null,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your email' : null,
                  ),
                  TextFormField(
                    controller: mobileController,
                    decoration:
                        const InputDecoration(labelText: 'Mobile Number'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your mobile number' : null,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter password' : null,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Confirm Password'),
                    validator: (value) =>
                        value!.isEmpty ? 'Confirm password' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signUp();
                        }
                      },
                      child: const Text('Sign Up')),
                  const SizedBox(height: 10),
                  Text(errorMsg, style: const TextStyle(color: Colors.red)),
                ],
              ),
            )),
      ),
    );
  }
}

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Page')),
      body: const Center(
        child: Text('Customer Features Coming Soon'),
      ),
    );
  }
}
