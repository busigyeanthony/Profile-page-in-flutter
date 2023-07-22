import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecondRoute(),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

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
        title: Text('Talent Home'),
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
                  decoration:
                      const InputDecoration(labelText: 'Talent Category'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    _talentDescription = value;
                  },
                  maxLines: 3,
                  decoration:
                      const InputDecoration(labelText: 'Talent Description'),
                ),
                const SizedBox(height: 10),
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
                  decoration:
                      const InputDecoration(labelText: 'Talent Experience'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    _socialMediaLink = value;
                  },
                  decoration:
                      const InputDecoration(labelText: 'Social Media Link'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Save the changes and update the user's profile
                  },
                  child: const Text('Save Changes'),
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
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'John Doe';
  String _email = 'john.doe@example.com';
  String _bio = 'Software Developer';
  String _location = 'New York';
  String _gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/ogw/AGvuzYYsdUuhDbvTfeLoNfKiBKR9lnUUx7qXVscnywtVZw=s32-c-mo'), // Replace with the user's profile image URL
          ),
          SizedBox(height: 20),
          Text('Name: $_name'),
          Text('Email: $_email'),
          Text('Bio: $_bio'),
          Text('Location: $_location'),
          Text('Gender: $_gender'),
        ],
      ),
    );
  }
}
