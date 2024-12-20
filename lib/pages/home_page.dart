import 'package:flutter/material.dart';
import 'package:breed_tracker/common_widgets/dog_builder.dart';
import 'package:breed_tracker/common_widgets/breed_builder.dart';
import 'package:breed_tracker/models/breed.dart';
import 'package:breed_tracker/models/dog.dart';
import 'package:breed_tracker/pages/breed_form_page.dart';
import 'package:breed_tracker/pages/dog_form_page.dart';
import 'package:breed_tracker/services/database_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Dog>> _getDogs() async {
    return await _databaseService.dogs();
  }

  Future<List<Breed>> _getBreeds() async {
    return await _databaseService.breeds();
  }

  Future<void> _onDogDelete(Dog dog) async {
    await _databaseService.deleteDog(dog.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Dog Database',
            style: TextStyle(
              fontWeight: FontWeight.bold,  // Make the title bold
              fontStyle: FontStyle.italic,   // Make the title italic
              fontSize: 24,                 // Make the title larger
              fontFamily: 'Bubble',         // Use bubble-like font (you can customize the font family)
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFE6E6FA),  // Light purple background color
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Dogs'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Breeds'),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'images/backhome.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // TabView Content
            TabBarView(
              children: [
                DogBuilder(
                  future: _getDogs(),
                  onEdit: (value) {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (_) => DogFormPage(dog: value),
                        fullscreenDialog: true,
                      ),
                    )
                        .then((_) => setState(() {}));
                  },
                  onDelete: _onDogDelete,
                ),
                BreedBuilder(
                  future: _getBreeds(),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (_) => BreedFormPage(),
                    fullscreenDialog: true,
                  ),
                )
                    .then((_) => setState(() {}));
              },
              heroTag: 'addBreed',
              child: FaIcon(FontAwesomeIcons.plus),
            ),
            SizedBox(height: 12.0),
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (_) => DogFormPage(),
                    fullscreenDialog: true,
                  ),
                )
                    .then((_) => setState(() {}));
              },
              heroTag: 'addDog',
              child: FaIcon(FontAwesomeIcons.paw),
            ),
          ],
        ),
      ),
    );
  }
}
