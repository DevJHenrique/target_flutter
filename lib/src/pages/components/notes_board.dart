import 'package:flutter/material.dart';

class NotesBoard extends StatelessWidget {
  const NotesBoard({super.key, required this.notesLength, required this.tile});

  final int notesLength;
  final Widget tile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: ListView.builder(
        itemCount: notesLength,
        itemBuilder: ((_, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: tile,
          );
        }),
      ),
    );
  }
}
