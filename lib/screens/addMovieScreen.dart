import 'package:flutter/material.dart';
import 'package:zupay/classes/movieData.dart';
import 'package:zupay/components/posterSelector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zupay/components/roundedButton.dart';

class AddMovieScreen extends StatefulWidget {
  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  String? image;
  String? name;
  String? director;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image!.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PosterSelector(
                path: image,
                onPressed: () async {
                  await pickImage().then((value) => print(image));
                }),
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter movie name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              onChanged: (value) {
                name = value;
                print(name);
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter director name',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              onChanged: (direct) {
                director = direct;
                print(director);
              },
            ),
            SizedBox(
              height: 16,
            ),
            RoundedButton(
              title: 'Add Movie',
              onPressed: () {
                Provider.of<MovieData>(context, listen: false)
                    .addMovie(image!, name, director);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ElevatedButton(
//   onPressed: () {
//     Provider.of<MovieData>(context, listen: false)
//         .addMovie(image!, name, director);
//     Navigator.pop(context);
//   },
//   child: Text('Add movie'),
// ),
