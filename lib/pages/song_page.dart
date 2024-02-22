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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //appBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //backbutton
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),

                    //title
                    const Text("P L A Y L I S T"),

                    //menu button

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                //album artwork
                NeuBox(
                  child: Column(
                    children: [
                      //image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("lib/models/assets/images/test.jpg"),
                      ),
                      //song and artist
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Commas",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text("Ayra")
                              ],
                            ),

                            //heart icon
                            Icon(
                              Icons.favorite,
                              color: Colors.cyan,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                //song duration progress
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //start time
                          Text("0.:"),

                          //shuffle icon

                          Icon(Icons.shuffle),

                          //repeat icon
                          Icon(Icons.repeat),

                          //end time
                          Text("3:00"),
                        ],
                      ),
                    ),
                    //song duration progress
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0)),
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: 50,
                        activeColor: Colors.amber,
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),

                //playback controls
                Row(
                  children: [
                    //skip previous

                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //play pause

                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //skip forward
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
