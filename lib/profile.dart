import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondRoute(),
    );
  }
}

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  String _talentCategory = 'Music';
  String _talentDescription = '';
  String _talentExperience = 'Beginner';
  String _socialMediaLink = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Talent'),
      ),
      body: ListView(
        children: [
          ProfilePage(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField(
                  value: _talentCategory,
                  items: ['Music', 'Dance', 'Art', 'Comedy', 'Others']
                      .map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _talentCategory = value.toString();
                    });
                  },
                  decoration: InputDecoration(labelText: 'Talent Category'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    _talentDescription = value;
                  },
                  maxLines: 3,
                  decoration: InputDecoration(labelText: 'Talent Description'),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  value: _talentExperience,
                  items: ['Beginner', 'Intermediate', 'Advanced']
                      .map((experience) {
                    return DropdownMenuItem(
                      value: experience,
                      child: Text(experience),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _talentExperience = value.toString();
                    });
                  },
                  decoration: InputDecoration(labelText: 'Talent Experience'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    _socialMediaLink = value;
                  },
                  decoration: InputDecoration(labelText: 'Social Media Link'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Save the changes and update the user's profile
                  },
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  _ProfilePageState createState() => _ProfilePageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ProfilePageState extends State<ProfilePage> {
  String _name = 'John Doe';
  String _email = 'john.doe@example.com';
  String _bio = 'Software Developer';
  String _location = 'New York';
  String _gender = 'Male';

  // Text editing controllers for editable fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = _name;
    _emailController.text = _email;
    _bioController.text = _bio;
    _locationController.text = _location;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://www.example.com/profile-image.jpg'), // Replace with the user's profile image URL
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _bioController,
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Bio/About Me'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
              value: _gender,
              items: ['Male', 'Female', 'Other'].map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _gender = value.toString();
                });
              },
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the changes and update the user's profile
                setState(() {
                  _name = _nameController.text;
                  _email = _emailController.text;
                  _bio = _bioController.text;
                  _location = _locationController.text;
                });
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
