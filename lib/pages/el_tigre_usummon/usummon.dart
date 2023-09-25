import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:utp_in_me/pages/el_tigre_usummon/appeal.dart';
import 'package:utp_in_me/pages/el_tigre_usummon/summon.dart';

class USummon extends StatelessWidget {
  USummon({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            title: const Text('USummon'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Summon",
                ),
                Tab(
                  text: "Appeal",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              USummonSummon(),
              USummonAppeal(),
            ],
          ),
        ));
  }
}