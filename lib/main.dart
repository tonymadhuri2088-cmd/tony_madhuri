import 'package:flutter/material.dart';

void main() => runApp(RetailApp());

class RetailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retail App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/////////////////////////////
// LANDING PAGE
/////////////////////////////
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Retail App Landing')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Shopkeeper Sign Up / Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ShopkeeperSignUp()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Customer Sign Up / Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CustomerSignUp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////
// SHOPKEEPER SIGN UP / LOGIN
/////////////////////////////
class ShopkeeperSignUp extends StatefulWidget {
  @override
  _ShopkeeperSignUpState createState() => _ShopkeeperSignUpState();
}

class _ShopkeeperSignUpState extends State<ShopkeeperSignUp> {
  final _shopNameController = TextEditingController();
  final _shopkeeperNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shopkeeper Sign Up / Login')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(controller: _shopNameController, decoration: InputDecoration(labelText: 'Shop Name')),
          TextField(controller: _shopkeeperNameController, decoration: InputDecoration(labelText: 'Shopkeeper Name')),
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone'), keyboardType: TextInputType.phone),
          TextField(controller: _addressController, decoration: InputDecoration(labelText: 'Address')),
          TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Sign Up / Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ShopkeeperDashboard(
                    shopName: _shopNameController.text,
                    shopkeeperName: _shopkeeperNameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    address: _addressController.text,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/////////////////////////////
// SHOPKEEPER DASHBOARD
/////////////////////////////
class ShopkeeperDashboard extends StatelessWidget {
  final String shopName;
  final String shopkeeperName;
  final String email;
  final String phone;
  final String address;

  ShopkeeperDashboard({
    required this.shopName,
    required this.shopkeeperName,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final _shopNameController = TextEditingController(text: shopName);
    final _shopkeeperNameController = TextEditingController(text: shopkeeperName);
    final _emailController = TextEditingController(text: email);
    final _phoneController = TextEditingController(text: phone);
    final _addressController = TextEditingController(text: address);

    return Scaffold(
      appBar: AppBar(title: Text('Shopkeeper Dashboard')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          /////////////////////////////
          // Primary Dashboard
          /////////////////////////////
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('Primary Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(
                title: Text('Revenue %'),
                subtitle: TextField(decoration: InputDecoration(hintText: 'Enter Revenue %')),
              ),
              ListTile(
                title: Text('Profit/Loss %'),
                subtitle: TextField(decoration: InputDecoration(hintText: 'Enter Profit/Loss %')),
              ),
              ListTile(
                title: Text('Total Products'),
                subtitle: TextField(decoration: InputDecoration(hintText: 'Enter total products')),
              ),
              ListTile(
                title: Text('Low Stock'),
                subtitle: TextField(decoration: InputDecoration(hintText: 'Enter low stock products')),
              ),
              ListTile(
                title: Text('Top Selling Products'),
                subtitle: TextField(decoration: InputDecoration(hintText: 'Enter top selling products')),
              ),
            ],
          ),

          /////////////////////////////
          // POS
          /////////////////////////////
          ExpansionTile(
            title: Text('POS', style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: Text('Product Search / Selection'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter Product Name'))),
              ListTile(title: Text('Quantity'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter Quantity'), keyboardType: TextInputType.number)),
              ListTile(title: Text('Discount / Tax'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter Discount / Tax'))),
              ListTile(title: Text('Total Bill'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter Total'))),
            ],
          ),

          /////////////////////////////
          // Inventory
          /////////////////////////////
          ExpansionTile(
            title: Text('Inventory', style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: Text('SKU (mandatory)'), subtitle: TextField()),
              ListTile(title: Text('Product Name'), subtitle: TextField()),
              ListTile(title: Text('Category'), subtitle: TextField()),
              ListTile(title: Text('MRP'), subtitle: TextField()),
              ListTile(title: Text('MSP'), subtitle: TextField()),
              ListTile(title: Text('Price'), subtitle: TextField()),
              ListTile(title: Text('Quantity'), subtitle: TextField()),
              ListTile(title: Text('Last Restock'), subtitle: TextField()),
            ],
          ),

          /////////////////////////////
          // Notifications
          /////////////////////////////
          ExpansionTile(
            title: Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: Text('Notification 1: Stock Alert')),
              ListTile(title: Text('Notification 2: New Message')),
            ],
          ),

          /////////////////////////////
          // Profile
          /////////////////////////////
          ExpansionTile(
            title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: Text('Shop Name'), subtitle: TextField(controller: _shopNameController)),
              ListTile(title: Text('Shopkeeper Name'), subtitle: TextField(controller: _shopkeeperNameController)),
              ListTile(title: Text('Email'), subtitle: TextField(controller: _emailController)),
              ListTile(title: Text('Phone'), subtitle: TextField(controller: _phoneController)),
              ListTile(title: Text('Address'), subtitle: TextField(controller: _addressController)),
              ListTile(title: Text('Change Password'), subtitle: TextField(obscureText: true, decoration: InputDecoration(hintText: 'New Password'))),
              ListTile(title: ElevatedButton(child: Text('Delete Account'), onPressed: () {})),
              ListTile(title: ElevatedButton(child: Text('Logout'), onPressed: () => Navigator.pop(context))),
            ],
          ),

          /////////////////////////////
          // Analysis
          /////////////////////////////
          ExpansionTile(
            title: Text('Analysis', style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: Text('Total Profit Gained'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter total profit'))),
              ListTile(title: Text('Estimated Growth Rate'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter estimated growth'))),
              ListTile(title: Text('Demand Forecast (5 products)'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter demand forecast'))),
              ListTile(title: Text('Top Selling Products (5)'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter top selling products'))),
              ListTile(title: Text('Total Sales (Daily/Weekly/Monthly/Yearly)'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter total sales'))),
              ListTile(title: Text('Low Stock Products (editable)'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter low stock products'))),
              ListTile(title: Text('Restock Recommendations (editable)'), subtitle: TextField(decoration: InputDecoration(hintText: 'Enter restock recommendations'))),
            ],
          ),
        ],
      ),
    );
  }
}

/////////////////////////////
// CUSTOMER SIGN UP / LOGIN
/////////////////////////////
class CustomerSignUp extends StatefulWidget {
  @override
  _CustomerSignUpState createState() => _CustomerSignUpState();
}

class _CustomerSignUpState extends State<CustomerSignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Sign Up / Login')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Full Name')),
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone'), keyboardType: TextInputType.phone),
          TextField(controller: _addressController, decoration: InputDecoration(labelText: 'Address')),
          TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Sign Up / Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CustomerDashboard(
                    name: _nameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                    address: _addressController.text,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/////////////////////////////
// CUSTOMER DASHBOARD
/////////////////////////////
class CustomerDashboard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;

  CustomerDashboard({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController(text: name);
    final _emailController = TextEditingController(text: email);
    final _phoneController = TextEditingController(text: phone);
    final _addressController = TextEditingController(text: address);

    return Scaffold(
      appBar: AppBar(title: Text('Customer Dashboard')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ExpansionTile(
            title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
            children: [
              ListTile(title: TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Full Name'))),
              ListTile(title: TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email'))),
              ListTile(title: TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone'))),
              ListTile(title: TextField(controller: _addressController, decoration: InputDecoration(labelText: 'Address'))),
              ListTile(
                title: ElevatedButton(
                  child: Text('Logout'),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          ExpansionTile(title: Text('Home / Quick Access'), children: [
            ListTile(title: Text('Categories, Products, Cart/Favorites')),
          ]),
        ],
      ),
    );
  }
}
