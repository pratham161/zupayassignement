import 'package:flutter/material.dart';
import 'package:zupay/components/movieList.dart';
import 'package:zupay/screens/addMovieScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zupay/classes/movieData.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  bool isDone = false;
  MovieData movieData = MovieData();
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signIn() async {
    await signInWithGoogle();
    setState(() {
      isDone = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signIn();
  }

  @override
  Widget build(BuildContext context) {
    return isDone
        ? Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddMovieScreen()));
              },
              backgroundColor: Colors.black,
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'MovieAdda',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              child: MovieList(),
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
