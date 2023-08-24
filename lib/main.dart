import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:match_app_first_firebase/matchdetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Matches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MatchesPage(),
    );
  }
}

class MatchesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Football Matches'),
      ),
      //  match_2(
      //   docID: 'argvsaf',
      // )
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('match_1').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final matches = snapshot.data!.docs;
            return ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                final match = matches[index];
                return ListTile(
                  trailing: Icon(Icons.switch_access_shortcut),
                  leading: Icon(Icons.sports_football),
                  title: Text(match.get('match_name')),
                  onTap: () {
                    //  print(match.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchDetailsPage(
                          matchId: match.id,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
