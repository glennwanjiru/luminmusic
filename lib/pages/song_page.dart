import 'package:flutter/material.dart';
import 'package:luminmusic/components/neu_box.dart';
import 'package:luminmusic/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              children: [
                //appBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //backbutton
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                    ),

                    //title
                    Text("P L A Y L I S T"),

                    //menu button

                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                  ],
                )

                //album artwork
                //NeuBox(child: child)

                //song duration progress

                //playback controls
              ],
            ),
          ),
        ),
      ),
    );
  }
}
