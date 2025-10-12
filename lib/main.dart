import 'package:flutter/material.dart';

void main() {
  runApp(InvenTrackApp());
}

class InvenTrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InvenTrack',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  void navigateToShopkeeperForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ShopkeeperFormPage()),
    );
  }

  void navigateToConsumerView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ConsumerViewPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to InvenTrack',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Text(
                'Login as:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => navigateToShopkeeperForm(context),
                child: Text('Shopkeeper'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => navigateToConsumerView(context),
                child: Text('Consumer'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Shopkeeper Form
class ShopkeeperFormPage extends StatefulWidget {
  @override
  _ShopkeeperFormPageState createState() => _ShopkeeperFormPageState();
}

class _ShopkeeperFormPageState extends State<ShopkeeperFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      // Normally, save data to backend or local DB
      String name = nameController.text;
      String email = emailController.text;
      String phone = phoneController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Shopkeeper Registered: $name')),
      );

      // Navigate to shopkeeper dashboard or inventory page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopkeeper Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (val) => val!.isEmpty ? 'Enter name' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter email' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (val) => val!.isEmpty ? 'Enter phone number' : null,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Consumer View
class ConsumerViewPage extends StatelessWidget {
  // Sample inventory items
  final List<Map<String, dynamic>> items = [
    {'name': 'Apple', 'price': 30, 'quantity': 50},
    {'name': 'Banana', 'price': 10, 'quantity': 100},
    {'name': 'Orange', 'price': 25, 'quantity': 40},
    {'name': 'Milk', 'price': 50, 'quantity': 20},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shop Inventory')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(item['name']),
              subtitle: Text('Price: \$${item['price']} | Quantity: ${item['quantity']}'),
            ),
          );
        },
      ),
    );
  }
}