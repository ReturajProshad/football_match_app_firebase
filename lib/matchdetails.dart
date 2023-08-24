import 'package:flutter/material.dart';
import 'package:match_app_first_firebase/match_list/itvssp.dart';

class MatchDetailsPage extends StatelessWidget {
  final String matchId;

  MatchDetailsPage({required this.matchId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Details'),
      ),
      body: match_2(
        docID: matchId,
      ),
    );
  }
}
