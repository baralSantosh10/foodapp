import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final String itemName;

  const MenuPage({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$itemName Menu'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildMenuItem(
                'Item 1', 'Description of Item 1', 'assets/images/pizza.png'),
            _buildMenuItem(
                'Item 2', 'Description of Item 2', 'assets/images/pizza.png'),
            _buildMenuItem(
                'Item 3', 'Description of Item 3', 'assets/images/pizza.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, String description, String imageUrl) {
    int itemCount = 0;

    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imageUrl,
                  width: 60, height: 60, fit: BoxFit.cover),
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
                fontSize: 18,
              ),
            ),
            subtitle: Text(description),
            trailing: SizedBox(
              width: 100, // Adjust width as needed
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.deepOrange),
                    onPressed: () {
                      setState(() {
                        itemCount++;
                      });
                    },
                  ),
                  Text(
                    '$itemCount',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.deepOrange,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.deepOrange),
                    onPressed: () {
                      setState(() {
                        if (itemCount > 0) itemCount--;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
