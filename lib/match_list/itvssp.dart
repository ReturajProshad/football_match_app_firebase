import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class match_2 extends StatelessWidget {
  final docID;
  const match_2({super.key, required this.docID});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('match_1')
            .doc(docID)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          print(snapshot.data?.data());
          if (snapshot.hasData) {
            final score = snapshot.data!;
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Text(
                    score.get('match_name'),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            score.get('score_team_a').toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            score.get('team_a'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Text(
                        'VS',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Column(
                        children: [
                          Text(
                            score.get('score_team_b').toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            score.get('team_b'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        score.get('time'),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Total Time: ' + score.get('total_time'),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
