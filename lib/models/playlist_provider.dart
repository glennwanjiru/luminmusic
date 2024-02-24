import 'package:flutter/material.dart';
import 'package:luminmusic/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = []
    
 
  int? _currentSongIndex;



  /*

  AUDIO PLAYER
  
  */
  //audio player

  //duration

  //constructor

  //initially not playing

  //play the song

  //


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
