import 'package:flutter/material.dart';
import 'package:luminmusic/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    //song 1
    Song(
        songName: "Commas",
        artistName: "Ayra Starr",
        albumArtImagePath: "lib/models/assets/images/test.jpg",
        audioPath:
            "lib/models/assets/audio/Ayra Starr - Commas (Lyric Video)(MP3_160K).mp3"),
  ];
  int? _currentSongIndex;

  /*
  GETTERS
  */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  /*
  SETTERS
  */

  set currentSongIndex(int? newIndex) {
    //update the current song index
    _currentSongIndex = newIndex;
    //update UI
    notifyListeners();
  }
}
