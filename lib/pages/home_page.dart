
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Taskify")),
      body: Center( // Center the entire content
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
            children: [
              // Add an image at the top of the page
              Image.asset(
                'assets/images/moon.jpeg', // Replace with your image file path
                height: 150, // Adjust the height as needed
                width: 150, // Adjust the width as needed
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20), // Spacing between the image and text
              Text(
                "Welcome to Taskify!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/todoList'),
                child: Text("Go to Todo List"),
              ),
              SizedBox(height: 10), // Adding some space between the buttons
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                child: Text("Go to Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


