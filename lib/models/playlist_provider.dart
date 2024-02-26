import 'package:audioplayers/audioplayers.dart';
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

    Song(
        songName: "partynice",
        artistName: "Busy signal",
        albumArtImagePath:
            "lib/models/assets/images/pexels-ashutosh-sonwani-1762578.jpg",
        audioPath:
            "lib/models/assets/audio/Busy Signal - Party Nice (Official Video)(MP3_160K).mp3")
  ];

  int? _currentSongIndex;

  /*

  AUDIO PLAYER
  
  */
  //audio player
  final AudioPlayer _audioPlayer = new AudioPlayer();

  //duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor

  PlaylistProvider() {
    listenToDuration();
  }
  //initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    if (_currentSongIndex != null) {
      final String path = _playlist[_currentSongIndex!].audioPath;
      await _audioPlayer.stop(); //stop current song
      await _audioPlayer.play(AssetSource(path)); //play new song
      _isPlaying = true;
      notifyListeners();
    }
  }

  //pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  //seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //play next song
  void playNextSong() async {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if its not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if its the last song,loop back to the beginning
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playPreviousSong() async {
    //if more than 2 seconds have passed, restart the song
    if (_currentDuration.inSeconds > 2) {
    }
    //if its within the first 2 seconds go  to the previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((playNextSong) {});
  }

  //dispose audio player

  /*
  GETTERS
  */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  /*
  SETTERS
  */

  set currentSongIndex(int? newIndex) {
    //update the current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); //play song at the new index
    }
    //update UI
    notifyListeners();
  }
}
