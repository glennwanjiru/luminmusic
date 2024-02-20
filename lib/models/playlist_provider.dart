import 'package:flutter/material.dart';
import 'package:luminmusic/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [];
}
