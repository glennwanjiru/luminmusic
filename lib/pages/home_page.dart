import 'package:flutter/material.dart';
import 'package:luminmusic/components/my_drawer.dart';
import 'package:luminmusic/models/playlist_provider.dart';
import 'package:luminmusic/models/song.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//get playlist provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

//go to song
  void goToSong(int songIndex) {
    //update current song index
    playlistProvider.currentSongIndex = songIndex;

    //navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SongPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text("P L A Y L I S T")),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          final List<Song> playlist = value.playlist;

          //return list view ui
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              final Song song = playlist[index];

              //return list tile ui
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
