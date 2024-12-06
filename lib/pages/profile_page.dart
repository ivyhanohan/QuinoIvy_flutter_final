// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String _name = "Ivy Quino";
//   String _email = "ivyquino@example.com";
//   String _bio = "This is a short bio about the user.";
//   final _formKey = GlobalKey<FormState>();

//   void _editProfile() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         String name = _name;
//         String email = _email;
//         String bio = _bio;

//         return AlertDialog(
//           title: Text('Edit Profile'),
//           content: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   TextFormField(
//                     initialValue: _name,
//                     decoration: InputDecoration(labelText: 'Name'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => name = value!,
//                   ),
//                   TextFormField(
//                     initialValue: _email,
//                     decoration: InputDecoration(labelText: 'Email'),
//                     validator: (value) {
//                       if (value == null || !value.contains('@')) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => email = value!,
//                   ),
//                   TextFormField(
//                     initialValue: _bio,
//                     decoration: InputDecoration(labelText: 'Bio'),
//                     maxLines: 3,
//                     onSaved: (value) => bio = value!,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   _formKey.currentState!.save();
//                   setState(() {
//                     _name = name;
//                     _email = email;
//                     _bio = bio;
//                   });
//                   Navigator.pop(context);
//                 }
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/images/moon.jpeg'),
//             ),
//             SizedBox(height: 16),
//             Text(
//               _name,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               _email,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             SizedBox(height: 16),
//             Text(
//               _bio,
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 14, color: Colors.black87),
//             ),
//             SizedBox(height: 32),
//             ElevatedButton.icon(
//               onPressed: _editProfile,
//               icon: Icon(Icons.edit),
//               label: Text('Edit Profile'),
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = "Ivy Quino";
  String _email = "ivyquino@example.com";
  String _bio = "This is a short bio about the user.";
  final _formKey = GlobalKey<FormState>();

  void _editProfile() {
    showDialog(
      context: context,
      builder: (context) {
        String name = _name;
        String email = _email;
        String bio = _bio;

        return AlertDialog(
          title: Text('Edit Profile'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    initialValue: _name,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) => name = value!,
                  ),
                  TextFormField(
                    initialValue: _email,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    onSaved: (value) => email = value!,
                  ),
                  TextFormField(
                    initialValue: _bio,
                    decoration: InputDecoration(labelText: 'Bio'),
                    maxLines: 3,
                    onSaved: (value) => bio = value!,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {
                    _name = name;
                    _email = email;
                    _bio = bio;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center( // Center the content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/moon.jpeg'),
              ),
              SizedBox(height: 16),
              Text(
                _name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                _email,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                _bio,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _editProfile,
                icon: Icon(Icons.edit),
                label: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

